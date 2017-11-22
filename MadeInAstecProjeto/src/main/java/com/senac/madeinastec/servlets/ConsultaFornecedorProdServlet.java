
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
@WebServlet(name = "ConsultaFornecedorProdServlet", urlPatterns = {"/consultafornecedorprod"})
public class ConsultaFornecedorProdServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          HttpSession sessao = request.getSession();  
          ArrayList<Fornecedor> Lista = new ArrayList();
          ServicoFornecedor sf = new ServicoFornecedor();
          String codigoempresa = (String) sessao.getAttribute("Empresa");
          
          try {
            Lista = (ArrayList<Fornecedor>) sf.listarFornecedor("", Integer.parseInt(codigoempresa));
        } catch (Exception e) {
        }
        
          sessao.setAttribute("ListaFornecedoresProd", Lista);
          
          RequestDispatcher dispatcher
	    = request.getRequestDispatcher("/cadastroProduto.jsp");
    dispatcher.forward(request, response);
    response.sendRedirect(request.getContextPath() + "/cadastroProduto.jsp"); 
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
          
    }

}
