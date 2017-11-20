
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.servlets;

import com.senac.madeinastec.model.Produto;
import com.senac.madeinastec.service.ServicoProduto;
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
@WebServlet(name = "ConsultaProdutoServlet", urlPatterns = {"/consultaprodutos"})
public class ConsultaProdutoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          HttpSession sessao = request.getSession();  
          ArrayList<Produto> Lista = new ArrayList();
          ServicoProduto sp = new ServicoProduto();
          String codigoempresa = (String) sessao.getAttribute("Empresa");
          
          try {
            Lista = (ArrayList<Produto>) sp.procurarProduto("", Integer.parseInt(codigoempresa));
        } catch (Exception e) {
        }
        
          sessao.setAttribute("ListaProdutos", Lista);
          
          RequestDispatcher dispatcher
	    = request.getRequestDispatcher("/consultarProduto.jsp");
    dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Instância Objeto Fornecedor
        Produto c = new Produto();
        
        //Instância de ArrayList para acumular fornecedores
        ArrayList<Produto> Lista = new ArrayList();
        
        //Instância serviço de servidor para efetuar consulta e ligação com FornecedorDAO
        ServicoProduto sp = new ServicoProduto();
        
        //Criação se sessão para retorno em tela
        HttpSession sessao = request.getSession();
        
        //Atribuição de valores digitados na tela de fornecedor e código da empresa
        String produto = request.getParameter("produto").toUpperCase();
        String codigoempresa = (String) sessao.getAttribute("Empresa");
        
        try {
            Lista = (ArrayList<Produto>) sp.procurarProduto(produto, Integer.parseInt(codigoempresa));
        } catch (Exception e) {
        }
        
        sessao.setAttribute("ListaProdutos", Lista);
        response.sendRedirect(request.getContextPath() + "/consultarProduto.jsp");   
        
    }

}
