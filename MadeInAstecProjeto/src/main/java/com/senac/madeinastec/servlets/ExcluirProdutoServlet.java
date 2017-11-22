/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.servlets;


import com.senac.madeinastec.service.ServicoProduto;
import java.io.IOException;
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
@WebServlet(name = "ExcluirProdutoServlet", urlPatterns = {"/excluirProduto"})
public class ExcluirProdutoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          RequestDispatcher dispatcher
	    = request.getRequestDispatcher("/consultarProduto.jsp");
    dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //Instância serviço de servidor para efetuar consulta e ligação com ClienteDAO
        ServicoProduto sp = new ServicoProduto();
        
        //Criação se sessão para retorno em tela
        HttpSession sessao = request.getSession();
        
        
        //Atribuição de valores digitados na tela de fornecedor e código da empresa
        String codigoproduto = request.getParameter("codigoproduto");
        String codigoempresa = (String) sessao.getAttribute("Empresa");
            
        try {
            sp.excluirProduto(Integer.parseInt(codigoproduto), Integer.parseInt(codigoempresa));
        } catch (Exception e) {
        }
        
        sessao.setAttribute("produtoexcluido", codigoproduto);
        response.sendRedirect(request.getContextPath() + "/consultarProduto.jsp");

        }
           
        
}


