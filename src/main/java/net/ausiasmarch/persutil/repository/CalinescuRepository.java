package net.ausiasmarch.persutil.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import net.ausiasmarch.persutil.entity.CalinescuEntity;

public interface CalinescuRepository extends JpaRepository<CalinescuEntity, Long> {

	CalinescuEntity findByIdAndPublicadoTrue(Long id);

	Page<CalinescuEntity> findByPublicadoTrue(Pageable pageable);


}

