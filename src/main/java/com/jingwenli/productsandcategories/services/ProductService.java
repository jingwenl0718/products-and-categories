package com.jingwenli.productsandcategories.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jingwenli.productsandcategories.models.Category;
import com.jingwenli.productsandcategories.models.Product;
import com.jingwenli.productsandcategories.repositories.ProductRepository;

@Service
public class ProductService {

	@Autowired
	private ProductRepository productRepo;
	
	@Autowired
	private CategoryService categoryService;
	
//	FIND ALL
	public List<Product> findAllProducts() {
		return productRepo.findAll();
	}
	
//	CREATE NEW PRODUCT
	public Product createNewProduct(Product product) {
		return productRepo.save(product);
	}
	
//	FIND ONE
	public Product findOneProduct(Long id) {
		Optional<Product> optionalProduct = productRepo.findById(id);
		if (optionalProduct.isPresent()) {
			return optionalProduct.get();
		} else {
			return null;
		}
	}
	
//	EDIT ONE
	public void editProduct(Long id, Long categoryId) {
		Product thisProduct = this.findOneProduct(id);
		Category thisCategory = categoryService.findOneCategory(categoryId);
		thisProduct.getCategories().add(thisCategory);
		productRepo.save(thisProduct);	
	}
}
