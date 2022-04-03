package com.AppRH.AppRH.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.AppRH.AppRH.models.Dependente;
import com.AppRH.AppRH.models.Empresa;
import com.AppRH.AppRH.models.Funcionario;
import com.AppRH.AppRH.repository.DependenteRepository;
import com.AppRH.AppRH.repository.EmpresaRepository;
import com.AppRH.AppRH.repository.FuncionarioRepository;

public class EmpresaController {
	

	@Autowired
	private EmpresaRepository fr;


	// GET que chama o form para cadastrar empresas
	@RequestMapping("/cadastrarEmpresa")
	public String form() {
		return "empresa/form-empresa";
	}

	// POST que cadastra empresas
	@RequestMapping(value = "/cadastrarEmpresa", method = RequestMethod.POST)
	public String form(@Valid Empresa empresa, BindingResult result, RedirectAttributes attributes) {

		if (result.hasErrors()) {
			attributes.addFlashAttribute("mensagem", "Verifique os campos");
			return "redirect:/cadastrarEmpresa";
		}

		fr.save(empresa);
		attributes.addFlashAttribute("mensagem", "Empresa cadastrada com sucesso!");
		return "redirect:/cadastrarEmpresa";
	}

	// GET que lista empresas
	@RequestMapping("/empresa")
	public ModelAndView listaEmpresa() {
		ModelAndView mv = new ModelAndView("empresa/lista-empresa");
		Iterable<Empresa> empresa = fr.findAll();
		mv.addObject("empresa", empresa);
		return mv;
	}
	
	//GET que deleta empresa
	@RequestMapping("/deletarEmpresa")
	public String deletarEmpresa(long id) {
		Empresa empresa = fr.findById(id);
		fr.delete(empresa);
		return "redirect:/empresa";
		
	}
	
	// Métodos que atualizam as empresas
	// GET que chama o FORM de edição da empresa
	@RequestMapping("/editar-empresa")
	public ModelAndView editarEmpresa(long id) {
		Empresa empresa = fr.findById(id);
		ModelAndView mv = new ModelAndView("empresa/update-empresa");
		mv.addObject("empresa", empresa);
		return mv;
	}
	
	// POST que atualiza a empresa
	@RequestMapping(value = "/editar-empresa", method = RequestMethod.POST)
	public String updateEmpresa(@Valid Empresa empresa,  BindingResult result, RedirectAttributes attributes){
		
		fr.save(empresa);
		attributes.addFlashAttribute("success", "Empresa alterada com sucesso!");
		
		long idLong = empresa.getId();
		String id = "" + idLong;
		return "redirect:/detalhes-empresa/" + id;
		
	}
	

}
