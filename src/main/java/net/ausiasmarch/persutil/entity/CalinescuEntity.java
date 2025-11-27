package net.ausiasmarch.persutil.entity;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;

import jakarta.annotation.Nullable;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "calinesculistacompra")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

public class CalinescuEntity {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    
    @NotNull
    @Size(min = 3, max = 255)
    private String nombre;
    
    @NotNull
    @Size(min = 3)
    private String contenido;

    @Nullable
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", shape = JsonFormat.Shape.STRING)
    @Column(name = "fechaCompraEsperada")

    private LocalDateTime fecha_compra_esperada;

    @NotNull
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", shape = JsonFormat.Shape.STRING)

    private LocalDateTime fecha_creacion;
    
    @Nullable
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", shape = JsonFormat.Shape.STRING)
    private LocalDateTime fecha_modificacion;

    @NotNull
    private boolean publicado=true;

    @Nullable
    private Double precio = 0.0;

    @NotNull
    private Integer cantidad = 1;

}
