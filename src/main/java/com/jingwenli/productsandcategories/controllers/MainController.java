package com.jingwenli.productsandcategories.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jingwenli.productsandcategories.models.Category;
import com.jingwenli.productsandcategories.models.Product;
import com.jingwenli.productsandcategories.services.CategoryService;
import com.jingwenli.productsandcategories.services.ProductService;

@Controller
public class MainController {

	@Autowired
	private ProductService productService;

	@Autowired
	private CategoryService categoryService;

//	FIND ALL
	@GetMapping("/")
	public String index(Model model, HttpSession session) {
		model.addAttribute("allProductList", productService.findAllProducts());
		model.addAttribute("allCategoryList", categoryService.findAllCategories());
		return "dashboard.jsp";
	}

//	CREATE NEW PRODUCT
	@GetMapping("/products/new")
	public String showNewProductForm(Model model, HttpSession session) {
		model.addAttribute("newProduct", new Product());
		return "newProduct.jsp";
	}

	@PostMapping("/products/new")
	public String processNewProduct(@Valid @ModelAttribute("newProduct") Product product, BindingResult result) {
		if (result.hasErrors()) {
			return "newProduct.jsp";
		} else {
			productService.createNewProduct(product);
			return "redirect:/";
		}
	}

//	CREATE NEW CATETORY
	@GetMapping("/categories/new")
	public String showNewCategoryForm(Model model, HttpSession session) {
		model.addAttribute("newCategory", new Category());
		return "newCategory.jsp";
	}

	@PostMapping("/categories/new")
	public String processNewCategory(@Valid @ModelAttribute("newCategory") Category category, BindingResult result) {
		if (result.hasErrors()) {
			return "newCategory.jsp";
		} else {
			categoryService.createNewCategory(category);
			return "redirect:/";
		}
	}

//	EDIT A PRODUCT
	@GetMapping("/products/{id}")
	public String showEditProductForm(@PathVariable("id") Long id, HttpSession session, Model model) {
		model.addAttribute("oneProduct", productService.findOneProduct(id));
		model.addAttribute("allCategoryList", categoryService.findAllCategories());
		return "editProduct.jsp";
	}
	
	@PutMapping("/products/{id}/edit")
	public String processEditProduct(@PathVariable("id") Long id, @RequestParam("categoryId") Long categoryId, Model model) {
		productService.editProduct(id, categoryId);
		model.addAttribute("oneProduct", productService.findOneProduct(id));
		model.addAttribute("allCategoryList", categoryService.findAllCategories());
		return "editProduct.jsp";
	}
	
//	EDIT A CATEGORY
	@GetMapping("/categories/{id}")
	public String showEditCategoryForm(@PathVariable("id") Long id, HttpSession session, Model model) {
		model.addAttribute("oneCategory", categoryService.findOneCategory(id));
		model.addAttribute("allProductList", productService.findAllProducts());
		return "editCategory.jsp";
	}
	
//	relationship can be editted from either side in a many-to-many relationship
	@PutMapping("/categories/{id}/edit")
	public String processEditCategory(@PathVariable("id") Long id, @RequestParam("productId") Long productId, Model model) {
		productService.editProduct(productId, id);
		model.addAttribute("oneCategory", categoryService.findOneCategory(id));
		model.addAttribute("allProductList", productService.findAllProducts());
		return "editCategory.jsp";
	}
}
