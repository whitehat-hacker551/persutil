package net.ausiasmarch.persutil.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import net.ausiasmarch.persutil.entity.ContrerasEntity;
import net.ausiasmarch.persutil.service.ContrerasService;

@CrossOrigin(origins = "*", allowedHeaders = "*")    //ESTO ES PARA SOLUCIONAR EL CORS
@RestController
@RequestMapping("/contreras")
public class ContrerasApi {

    @Autowired
    ContrerasService oContrerasService;

    // ----------------------------CRUD---------------------------------

    // obtener post por id
    @GetMapping("/{id}")
    public ResponseEntity<ContrerasEntity> get(@PathVariable Long id) {
        return ResponseEntity.ok(oContrerasService.get(id));
    }

    // crear posts
    @PostMapping("")
    public ResponseEntity<Long> create(@RequestBody ContrerasEntity contrerasEntity) {
        return ResponseEntity.ok(oContrerasService.create(contrerasEntity));
    }

    // modificar posts
    @PutMapping("")
    public ResponseEntity<Long> update(@RequestBody ContrerasEntity contrerasEntity) {
        return ResponseEntity.ok(oContrerasService.update(contrerasEntity));
    }

    // borrar posts
    @DeleteMapping("/{id}")
    public ResponseEntity<Long> delete(@PathVariable Long id) {
        return ResponseEntity.ok(oContrerasService.delete(id));
    }

    // listado paginado de posts
    @GetMapping("")
    public ResponseEntity<Page<ContrerasEntity>> getPage(Pageable oPageable) {
        return ResponseEntity.ok(oContrerasService.getPage(oPageable));
        
    }

    @GetMapping("/count")
    public ResponseEntity<Long> count() {
        return ResponseEntity.ok(oContrerasService.count()); 
    }
}
