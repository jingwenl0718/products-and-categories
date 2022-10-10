package com.jingwenli.productsandcategories.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jingwenli.productsandcategories.models.Category;

@Repository
public interface CategoryRepository extends CrudRepository<Category, Long> {

	List<Category> findAll();
}
