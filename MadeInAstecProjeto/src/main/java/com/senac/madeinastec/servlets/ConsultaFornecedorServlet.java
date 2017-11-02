/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.servlets;

import com.senac.madeinastec.dao.FornecedorDAO;
import com.senac.madeinastec.exceptions.FornecedorException;
import com.senac.madeinastec.exceptions.DataSourceException;
import com.senac.madeinastec.model.Fornecedor;
import com.senac.madeinastec.service.ServicoFornecedor;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "ConsultaFornecedorServlet", urlPatterns = {"/fornecedor"})
public class ConsultaFornecedorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          RequestDispatcher dispatcher
	    = request.getRequestDispatcher("/consultarFornecedor.jsp");
    dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Instância Objeto Fornecedor
        Fornecedor f = new Fornecedor();
        
        //Instância de ArrayList para acumular fornecedores
        ArrayList<Fornecedor> Lista = new ArrayList();
        
        //Instância serviço de servidor para efetuar consulta e ligação com FornecedorDAO
        ServicoFornecedor sf = new ServicoFornecedor();
        
        //Criação se sessão para retorno em tela
        HttpSession sessao = request.getSession();
        
        //Atribuição de valores digitados na tela de fornecedor e código da empresa
        String fornecedor = request.getParameter("fornecedor").toUpperCase();
        String codigoempresa = (String) sessao.getAttribute("Empresa");
        
        try {
            Lista = (ArrayList<Fornecedor>) sf.listarFornecedor(fornecedor, Integer.parseInt(codigoempresa));
        } catch (Exception e) {
        }
        
        sessao.setAttribute("ListaFornecedores", Lista);
        response.sendRedirect(request.getContextPath() + "/consultarFornecedor.jsp");   
        
    }

}
