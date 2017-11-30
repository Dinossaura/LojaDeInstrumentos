
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.servlets;

import com.senac.madeinastec.model.Cliente;
import com.senac.madeinastec.service.ServicoCliente;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author magno
 */
@WebServlet(name = "ConsultaClienteServlet", urlPatterns = {"/consultacliente"})
public class ConsultaClienteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          HttpSession sessao = request.getSession();  
          ArrayList<Cliente> Lista = new ArrayList();
          ServicoCliente sc = new ServicoCliente();
          String codigoempresa = (String) sessao.getAttribute("Empresa");
          
          try {
            Lista = (ArrayList<Cliente>) sc.procurarCliente("", Integer.parseInt(codigoempresa));
        } catch (Exception e) {
        }
        
          sessao.setAttribute("ListaClientes", Lista);
          
          RequestDispatcher dispatcher
	    = request.getRequestDispatcher("/consultarCliente.jsp");
    dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Instância Objeto Fornecedor
        Cliente c = new Cliente();
        
        //Instância de ArrayList para acumular fornecedores
        ArrayList<Cliente> Lista = new ArrayList();
        
        //Instância serviço de servidor para efetuar consulta e ligação com FornecedorDAO
        ServicoCliente sc = new ServicoCliente();
        
        //Criação se sessão para retorno em tela
        HttpSession sessao = request.getSession();
        
        //Atribuição de valores digitados na tela de fornecedor e código da empresa
        String cliente = request.getParameter("cliente").toLowerCase();
        
        String codigoempresa = (String) sessao.getAttribute("Empresa");
       
        try {
            Lista = (ArrayList<Cliente>) sc.procurarCliente(cliente, Integer.parseInt(codigoempresa));
        } catch (Exception e) {
        }
        
        sessao.setAttribute("ListaClientes", Lista);
        response.sendRedirect(request.getContextPath() + "/consultarCliente.jsp");   
        
    }

}
