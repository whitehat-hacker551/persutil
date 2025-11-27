package net.ausiasmarch.persutil.service;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import net.ausiasmarch.persutil.entity.CalinescuEntity;
import net.ausiasmarch.persutil.repository.CalinescuRepository;

@Service

public class CalinescuService {
    
    @Autowired
    CalinescuRepository oCalinescuRepository;

public Long rellenaListaCompra(Long numProductos) {
        for (long j = 0; j < numProductos; j++) {
            // crea entity blog y la rellana con datos aleatorios
            CalinescuEntity oCalinescuEntity = new CalinescuEntity();
            oCalinescuEntity.setNombre("Producto"+j);
            // rellena contenido
            String contenidoGenerado="";
            for (int i = 1; i <= numProductos; i++) {
                contenidoGenerado += "contenido"+i;
                
            }
            oCalinescuEntity.setContenido(contenidoGenerado.trim());
            contenidoGenerado += "\n";
            oCalinescuEntity.setFecha_compra_esperada(null);
            oCalinescuEntity.setFecha_creacion(LocalDateTime.now());
            oCalinescuEntity.setFecha_modificacion(null);
            oCalinescuEntity.setPublicado(true);
            // guardar entity en base de datos
            oCalinescuRepository.save(oCalinescuEntity);
        }
        return oCalinescuRepository.count();
    }

    public CalinescuEntity get(Long id) {
        return oCalinescuRepository.findById(id).orElseThrow(() -> new RuntimeException("Blog not found"));
    }

    public Long create(CalinescuEntity calinescuEntity) {
        calinescuEntity.setFecha_creacion(LocalDateTime.now());
        calinescuEntity.setFecha_modificacion(null);
        oCalinescuRepository.save(calinescuEntity);
        return calinescuEntity.getId();
    }

    public Long update(CalinescuEntity calinescuEntity) {
        CalinescuEntity existingListaCompra = oCalinescuRepository.findById(calinescuEntity.getId())
                .orElseThrow(() -> new RuntimeException("Lista de compra no encontrada"));
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
        oCalinescuRepository.deleteById(id);
        return id;
    }

    public Page<CalinescuEntity> getPage(Pageable oPageable, Boolean publicado) {
        if (publicado != null) {
            // Filtrar manualmente la lista completa y crear una sublista paginada
            var todasLasEntidades = oCalinescuRepository.findAll();
            var filtradas = todasLasEntidades.stream()
                    .filter(item -> item.isPublicado() == publicado)
                    .toList();
            
            // Calcular paginación manual
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
        return oCalinescuRepository.findAll(oPageable);
    }

    public Long count(Boolean publicado) {
        if (publicado != null) {
            return oCalinescuRepository.findAll().stream()
                    .filter(item -> item.isPublicado() == publicado)
                    .count();
        }
        return oCalinescuRepository.count();
    }

    public Double calcularTotalPrecios(Boolean publicado) {
        return oCalinescuRepository.findAll().stream()
                .filter(item -> publicado == null || item.isPublicado() == publicado)
                .mapToDouble(item -> {
                    Double precio = item.getPrecio() != null ? item.getPrecio() : 0.0;
                    Integer cantidad = item.getCantidad() != null ? item.getCantidad() : 1;
                    return precio * cantidad;
                })
                .sum();
    }

    public Long deleteAll() {
        Long count = oCalinescuRepository.count();
        oCalinescuRepository.deleteAll();
        return count;
    }
}
