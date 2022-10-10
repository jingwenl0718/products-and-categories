package com.jingwenli.productsandcategories.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jingwenli.productsandcategories.models.Category;
import com.jingwenli.productsandcategories.models.Product;
import com.jingwenli.productsandcategories.repositories.CategoryRepository;

@Service
public class CategoryService {
	
	@Autowired
	private CategoryRepository categoryRepo;
	
//	FIND ALL
	public List<Category> findAllCategories() {
		return categoryRepo.findAll();
	}
	
//	FINE ONE
	public Category findOneCategory(Long id) {
		Optional<Category> optionalCategory = categoryRepo.findById(id);
		if (optionalCategory.isPresent()) {
			return optionalCategory.get();
		} else {
			return null;
		}
	}
	
//	CREATE NEW CATEGORY
	public Category createNewCategory(Category category) {
		return categoryRepo.save(category);
	}
	
}
