package com.senac.madeinastec.servlets;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.senac.madeinastec.model.Fornecedor;
import com.senac.madeinastec.service.ServicoFornecedor;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "CadastrarFornecedorServlet", urlPatterns = {"/cadastro-fornecedor"})
public class CadastrarFornecedorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          HttpSession sessao = request.getSession();
        
        String fornecedor = request.getParameter("fornecedor").toUpperCase();
        String empresa = request.getParameter("empresa");
        
        Fornecedor forne = new Fornecedor();
        forne.setNome(fornecedor);
        forne.setCodigoempresa(Integer.parseInt(empresa));
     
        ServicoFornecedor sf = new ServicoFornecedor();
        try {
            sf.cadastrarFornecedor(forne);
            sessao.setAttribute("Fornecedor", forne);
            response.sendRedirect(request.getContextPath() + "/cadastroFornecedor.jsp");
            System.out.println("Fornecedor Inserido com sucesso!");
            
        } catch (Exception e) {
            request.setAttribute("mensagemErro", "Fornecedor não cadastrado");
            RequestDispatcher dispatcher
	      = request.getRequestDispatcher("/cadastroFornecedor.jsp");
            dispatcher.forward(request, response);
            System.out.println("Erro na inserção de novo fornecedor!");
        }
        
    }

}