/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.servlets;

import com.senac.madeinastec.model.Carrinho;
import com.senac.madeinastec.model.Cliente;
import com.senac.madeinastec.model.ItemCarrinho;
import com.senac.madeinastec.model.Produto;
import com.senac.madeinastec.service.ServicoCarrinho;
import com.senac.madeinastec.service.ServicoCliente;
import com.senac.madeinastec.service.ServicoItemCarrinho;
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
@WebServlet(name = "ListagemDeCarrinhoServlet", urlPatterns = {"/listagemcarrinho"})
public class ListagemDeCarrinhoServlet extends HttpServlet {


     
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServicoCarrinho sc = new ServicoCarrinho();
        ServicoItemCarrinho sic = new ServicoItemCarrinho();
        ServicoProduto sp = new ServicoProduto();
        ServicoCliente scli = new ServicoCliente();
        
        Carrinho carrinho = new Carrinho();
        ItemCarrinho itemcarrinho = new ItemCarrinho();
        
        List<ItemCarrinho> listaitens= new ArrayList<ItemCarrinho>();
        List<Produto> listaprodutos = new ArrayList<Produto>();
        List<Cliente> listaclientes = new ArrayList<Cliente>();
        
        //Criação se sessão para retorno em tela
        HttpSession sessao = request.getSession();
        
        String codigoCarrinho = request.getParameter("codigocarrinho");
        String codigoempresa = (String) sessao.getAttribute("Empresa");
        
        try {
            carrinho = sc.retornaCarrinho(Integer.parseInt(codigoCarrinho));
            listaitens = sic.listarItensCarrinho(Integer.parseInt(codigoCarrinho));
            listaprodutos = sp.listarProdutos(Integer.parseInt(codigoempresa));
            listaclientes =scli.listarClientes(Integer.parseInt(codigoempresa));
        } catch (Exception e) {
        }
        
        sessao.setAttribute("cabecalhocarrinho", carrinho);
        sessao.setAttribute("itenscarrinho", listaitens);
        sessao.setAttribute("listaprodutos", listaprodutos);
        sessao.setAttribute("listaclientes", listaclientes);
        
        //Remove venda feita anteriormente
        sessao.removeAttribute("venda");
        response.sendRedirect(request.getContextPath() + "/finalizarVenda.jsp");   
        
        
    }

}
