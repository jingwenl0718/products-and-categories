package com.jingwenli.productsandcategories.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jingwenli.productsandcategories.models.Product;

@Repository
public interface ProductRepository extends CrudRepository<Product, Long> {

	List<Product> findAll();
	
	
}
