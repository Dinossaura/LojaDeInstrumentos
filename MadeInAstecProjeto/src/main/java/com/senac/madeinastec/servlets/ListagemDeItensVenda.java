/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.servlets;

import com.senac.madeinastec.model.Carrinho;
import com.senac.madeinastec.model.Cliente;
import com.senac.madeinastec.model.ItemVenda;
import com.senac.madeinastec.model.Produto;
import com.senac.madeinastec.service.ServicoCarrinho;
import com.senac.madeinastec.service.ServicoCliente;
import com.senac.madeinastec.service.ServicoItemCarrinho;
import com.senac.madeinastec.service.ServicoItemVenda;
import com.senac.madeinastec.service.ServicoProduto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mayra Pereira
 */
@WebServlet(name = "ListagemDeItensVenda", urlPatterns = {"/listaritens"})
public class ListagemDeItensVenda extends HttpServlet {


     
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServicoItemVenda siv = new ServicoItemVenda();

        ItemVenda itemcarrinho = new ItemVenda();
        
        List<ItemVenda> listaitens= new ArrayList<ItemVenda>();
        
        //Criação se sessão para retorno em tela
        HttpSession sessao = request.getSession();
        
        String codigovenda = request.getParameter("codigovenda");

        try {
            listaitens = siv.listarItensVenda(Integer.parseInt(codigovenda));
        } catch (Exception e) {
        }

        sessao.setAttribute("itensvenda", listaitens);
        response.sendRedirect(request.getContextPath() + "/relatorio.jsp");   
        
        
    }

}
