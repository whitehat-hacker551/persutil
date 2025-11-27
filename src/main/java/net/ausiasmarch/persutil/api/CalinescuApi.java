package net.ausiasmarch.persutil.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import net.ausiasmarch.persutil.entity.CalinescuEntity;
import net.ausiasmarch.persutil.service.CalinescuService;



@CrossOrigin(origins = "*", allowedHeaders = "*")
@RestController
@RequestMapping("/calinescuListaCompra")

public class CalinescuApi {

@Autowired
CalinescuService oCalinescuService;

 @GetMapping("/rellena/{numProductos}")
    public ResponseEntity<Long> rellenaListaCompra(
            @PathVariable Long numProductos
    ) {
        return ResponseEntity.ok(oCalinescuService.rellenaListaCompra(numProductos));
    }
    @GetMapping("/saludar")
    public ResponseEntity<String> saludar() {
        return new ResponseEntity<>("\"Hola desde el blog\"", HttpStatus.OK);
    }
// obtener post por id
    @GetMapping("/{id}")
    public ResponseEntity<CalinescuEntity> get(@PathVariable Long id) {
        return ResponseEntity.ok(oCalinescuService.get(id));
    }

    // crear posts
    @PostMapping("")
    public ResponseEntity<Long> create(@RequestBody CalinescuEntity calinescuEntity) {
        return ResponseEntity.ok(oCalinescuService.create(calinescuEntity));
    }

    // modificar posts
    @PutMapping("")
    public ResponseEntity<Long> update(@RequestBody CalinescuEntity calinescuEntity) {
        return ResponseEntity.ok(oCalinescuService.update(calinescuEntity));
    }

    // borrar posts
    @DeleteMapping("/{id}")
    public ResponseEntity<Long> delete(@PathVariable Long id) {
        return ResponseEntity.ok(oCalinescuService.delete(id));
    }

    // listado paginado de posts
    @GetMapping("")
    public ResponseEntity<Page<CalinescuEntity>> getPage(
            Pageable oPageable,
            @RequestParam(required = false) Boolean publicado) {
        return ResponseEntity.ok(oCalinescuService.getPage(oPageable, publicado));
        
    }

    @GetMapping("/count")
    public ResponseEntity<Long> count(@RequestParam(required = false) Boolean publicado) {
        return ResponseEntity.ok(oCalinescuService.count(publicado)); 
    }

    @GetMapping("/total")
    public ResponseEntity<Double> calcularTotalPrecios(@RequestParam(required = false) Boolean publicado) {
        return ResponseEntity.ok(oCalinescuService.calcularTotalPrecios(publicado));
    }

    @DeleteMapping("/all")
    public ResponseEntity<Long> deleteAll() {
        return ResponseEntity.ok(oCalinescuService.deleteAll());
    }

}
