package com.discount.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.discount.domain.Client;
import com.discount.service.ClientService;

@Controller
@RequestMapping(UrlConstants.CLIENT)
public class ClientController {

	@Autowired
	private ClientService clientService;

	@RequestMapping(UrlConstants.CLIENT)
	public String getClients(Map<String, Object> map) {

		map.put("client", new Client());
		map.put("clientList", clientService.findAll());

		return "client";
	}

	@RequestMapping("/")
	public String home() {
		return "redirect:/index";
	}

	@RequestMapping(value = UrlConstants.ADD, method = RequestMethod.POST)
	public String addClient(@ModelAttribute("client") Client client,
			BindingResult result) {

		clientService.save(client);

		return "redirect:/client";
	}

	@RequestMapping(UrlConstants.DELETE_CLIENT)
	public String deleteClient(@PathVariable("clientId") Integer clientId) {

		clientService.delete(clientService.findById(clientId));

		return "redirect:/client";
	}
}
