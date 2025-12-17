package net.ausiasmarch.persutil.service;

import java.time.LocalDateTime;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import net.ausiasmarch.persutil.entity.CalinescuEntity;
import net.ausiasmarch.persutil.exception.ResourceNotFoundException;
import net.ausiasmarch.persutil.exception.UnauthorizedException;
import net.ausiasmarch.persutil.repository.CalinescuRepository;

@Service
public class CalinescuService {

    @Autowired
    CalinescuRepository oCalinescuRepository;

    @Autowired
    AleatorioService oAleatorioService;

    @Autowired
    SessionService oSessionService;

    ArrayList<String> alNombres = new ArrayList<>();

    public CalinescuService() {
        alNombres.add("Pan");
        alNombres.add("Leche");
        alNombres.add("Huevos");
        alNombres.add("Azucar");
        alNombres.add("Sal");
        alNombres.add("Arroz");
        alNombres.add("Pasta");
        alNombres.add("Aceite");
        alNombres.add("Tomate");
        alNombres.add("Cafe");
    }

    public Long rellenaListaCompra(Long numProductos) {

        if (!oSessionService.isSessionActive()) {
            throw new UnauthorizedException("No active session");
        }

        for (long j = 0; j < numProductos; j++) {
            CalinescuEntity oCalinescuEntity = new CalinescuEntity();
            oCalinescuEntity.setNombre(
                    alNombres.get(oAleatorioService.GenerarNumeroAleatorioEnteroEnRango(0, alNombres.size() - 1))
                            + j);
            // rellena contenido
            String contenidoGenerado = "";
            int numItems = oAleatorioService.GenerarNumeroAleatorioEnteroEnRango(1, 5);
            for (int i = 1; i <= numItems; i++) {
                contenidoGenerado += "Item" + i + " ";
            }
            oCalinescuEntity.setContenido(contenidoGenerado.trim());
            oCalinescuEntity.setFecha_compra_esperada(null);
            oCalinescuEntity.setFecha_creacion(LocalDateTime.now());
            oCalinescuEntity.setFecha_modificacion(null);
            oCalinescuEntity.setPublicado(true);
            oCalinescuRepository.save(oCalinescuEntity);
        }
        return oCalinescuRepository.count();
    }

    public CalinescuEntity get(Long id) {
        if (oSessionService.isSessionActive()) {
            return oCalinescuRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException("ListaCompra not found"));
        } else {
            CalinescuEntity entity = oCalinescuRepository.findByIdAndPublicadoTrue(id);
            if (entity == null) {
                throw new ResourceNotFoundException("ListaCompra not found or not published");
            }
            return entity;
        }
    }

    public Long create(CalinescuEntity calinescuEntity) {
        if (!oSessionService.isSessionActive()) {
            throw new UnauthorizedException("No active session");
        }
        calinescuEntity.setFecha_creacion(LocalDateTime.now());
        calinescuEntity.setFecha_modificacion(null);
        oCalinescuRepository.save(calinescuEntity);
        return calinescuEntity.getId();
    }

    public Long update(CalinescuEntity calinescuEntity) {
        if (!oSessionService.isSessionActive()) {
            throw new UnauthorizedException("No active session");
        }
        CalinescuEntity existingListaCompra = oCalinescuRepository.findById(calinescuEntity.getId())
                .orElseThrow(() -> new ResourceNotFoundException("Lista de compra no encontrada"));
        existingListaCompra.setNombre(calinescuEntity.getNombre());
        existingListaCompra.setContenido(calinescuEntity.getContenido());
        existingListaCompra.setFecha_compra_esperada(calinescuEntity.getFecha_compra_esperada());
        existingListaCompra.setPublicado(calinescuEntity.isPublicado());
        existingListaCompra.setPrecio(calinescuEntity.getPrecio());
        existingListaCompra.setCantidad(calinescuEntity.getCantidad());
        existingListaCompra.setFecha_modificacion(LocalDateTime.now());
        oCalinescuRepository.save(existingListaCompra);
        return existingListaCompra.getId();
    }

    public Long delete(Long id) {
        if (!oSessionService.isSessionActive()) {
            throw new UnauthorizedException("No active session");
        }
        oCalinescuRepository.deleteById(id);
        return id;
    }

    public Page<CalinescuEntity> getPage(Pageable oPageable, Boolean publicado, String filter) {
        // Si se solicita filtrado explícito por publicado y/o texto, aplicar filtro in-memory
        if (publicado != null || (filter != null && !filter.isBlank())) {
            // Filtrar manualmente la lista completa y crear una sublista paginada
            var todasLasEntidades = oCalinescuRepository.findAll();
            var filtradas = todasLasEntidades.stream()
                    .filter(item -> (publicado == null || item.isPublicado() == publicado))
                    .filter(item -> {
                        if (filter == null || filter.isBlank()) return true;
                        String f = filter.toLowerCase();
                        boolean matchNombre = item.getNombre() != null && item.getNombre().toLowerCase().contains(f);
                        boolean matchContenido = item.getContenido() != null && item.getContenido().toLowerCase().contains(f);
                        return matchNombre || matchContenido;
                    })
                    .toList();

            int start = (int) oPageable.getOffset();
            int end = Math.min((start + oPageable.getPageSize()), filtradas.size());

            if (start > filtradas.size()) {
                start = 0;
                end = Math.min(oPageable.getPageSize(), filtradas.size());
            }

            var paginaActual = filtradas.subList(start, end);
            return new org.springframework.data.domain.PageImpl<>(
                    paginaActual,
                    oPageable,
                    filtradas.size()
            );
        }
        // si no hay session activa, devolver solo publicados
        if (!oSessionService.isSessionActive()) {
            return oCalinescuRepository.findByPublicadoTrue(oPageable);
        } else {
            return oCalinescuRepository.findAll(oPageable);
        }
    }

    public Long count(Boolean publicado, String filter) {
        if (publicado != null || (filter != null && !filter.isBlank())) {
            return oCalinescuRepository.findAll().stream()
                    .filter(item -> (publicado == null || item.isPublicado() == publicado))
                    .filter(item -> {
                        if (filter == null || filter.isBlank()) return true;
                        String f = filter.toLowerCase();
                        return (item.getNombre() != null && item.getNombre().toLowerCase().contains(f))
                                || (item.getContenido() != null && item.getContenido().toLowerCase().contains(f));
                    })
                    .count();
        }
        return oCalinescuRepository.count();
    }

    public Double calcularTotalPrecios(Boolean publicado) {
        return oCalinescuRepository.findAll().stream()
                .filter(item -> publicado == null || item.isPublicado() == publicado)
                .mapToDouble(item -> {
                    Double p = item.getPrecio();
                    Integer c = item.getCantidad();
                    double precio = (p != null) ? p : 0.0d;
                    int cantidad = (c != null) ? c : 1;
                    return precio * cantidad;
                })
                .sum();
    }

    public Long deleteAll() {
        if (!oSessionService.isSessionActive()) {
            throw new UnauthorizedException("No active session");
        }
        Long count = oCalinescuRepository.count();
        oCalinescuRepository.deleteAll();
        return count;
    }

    public Long publicar(Long id) {
        if (!oSessionService.isSessionActive()) {
            throw new UnauthorizedException("No active session");
        }
        CalinescuEntity existing = oCalinescuRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("ListaCompra not found"));
        existing.setPublicado(true);
        existing.setFecha_modificacion(LocalDateTime.now());
        oCalinescuRepository.save(existing);
        return existing.getId();
    }

    public Long despublicar(Long id) {
        if (!oSessionService.isSessionActive()) {
            throw new UnauthorizedException("No active session");
        }
        CalinescuEntity existing = oCalinescuRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("ListaCompra not found"));
        existing.setPublicado(false);
        existing.setFecha_modificacion(LocalDateTime.now());
        oCalinescuRepository.save(existing);
        return existing.getId();
    }
}
