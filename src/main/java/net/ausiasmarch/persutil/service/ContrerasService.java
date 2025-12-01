package net.ausiasmarch.persutil.service;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import net.ausiasmarch.persutil.entity.ContrerasEntity;
import net.ausiasmarch.persutil.repository.ContrerasRepository;

@Service    //Es necesatrio poner el @service para que lo detecten
public class ContrerasService {

    @Autowired
    ContrerasRepository oContrerasRepository;

     // ----------------------------CRUD---------------------------------
    public ContrerasEntity get(Long id) {
        return oContrerasRepository.findById(id).orElseThrow(() -> new RuntimeException("Contreras not found"));
    }

    public Long create(ContrerasEntity contrerasEntity) {
        contrerasEntity.setFechaCreacion(LocalDateTime.now());
        contrerasEntity.setFechaModificacion(null);
        oContrerasRepository.save(contrerasEntity);
        return contrerasEntity.getId();
    }

    public Long update(ContrerasEntity contrerasEntity) {
        ContrerasEntity existingContreras = oContrerasRepository.findById(contrerasEntity.getId())
                .orElseThrow(() -> new RuntimeException("Contreras not found"));
        existingContreras.setTitulo(contrerasEntity.getTitulo());
        existingContreras.setContenido(contrerasEntity.getContenido());
        existingContreras.setEtiquetas(contrerasEntity.getEtiquetas());
        existingContreras.setPublico(contrerasEntity.isPublico());
        existingContreras.setFechaModificacion(LocalDateTime.now());
        oContrerasRepository.save(existingContreras);
        return existingContreras.getId();
    }

    public Long delete(Long id) {
        oContrerasRepository.deleteById(id);
        return id;
    }

    public Page<ContrerasEntity> getPage(Pageable oPageable) {
        return oContrerasRepository.findAll(oPageable);
    }

    public Long count() {
        return oContrerasRepository.count();
    }

}