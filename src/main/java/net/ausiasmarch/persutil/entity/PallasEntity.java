package net.ausiasmarch.persutil.entity;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;

import jakarta.annotation.Nullable;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "pallas")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PallasEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @NotNull
    @Size(min = 3, max = 1024)
    private String titulo;
    @NotNull
    @Size(min = 3)
    private String contenido;
    @NotNull
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", shape = JsonFormat.Shape.STRING)
    private LocalDateTime fechaCreacion;
    @Nullable
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", shape = JsonFormat.Shape.STRING)
    private LocalDateTime fechaModificacion;
    @NotNull
    private boolean publicado;

    
}