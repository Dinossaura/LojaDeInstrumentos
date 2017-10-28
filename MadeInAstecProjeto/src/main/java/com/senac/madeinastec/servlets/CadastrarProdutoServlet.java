/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.servlets;

import com.senac.madeinastec.dao.ProdutoDAO;
import com.senac.madeinastec.model.Produto;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "CadastrarProdutoServlet", urlPatterns = {"/cadastrar-produto"})
public class CadastrarProdutoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         String destino;
        
        HttpSession sessao = request.getSession();
        if (sessao.getAttribute("produto") != null) {
            request.setAttribute("produto", sessao.getAttribute("produto"));
            // Remove o atributo da sessao para usuario nao ficar preso na tela de resultados
            sessao.removeAttribute("produto");
            
            destino = "produtos";
        } else {
            destino = "cadastroProduto.jsp";
        }
        
        RequestDispatcher dispatcher = request.getRequestDispatcher(destino);
        dispatcher.forward(request, response);
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String produto = request.getParameter("prod");
        String desc = request.getParameter("descProd");
        String cat = request.getParameter("categ");
        String codE = request.getParameter("empresa");
        String codF = request.getParameter("codF");
        String estoque = request.getParameter("estoque");
        String compra = request.getParameter("compra");
        String venda = request.getParameter("venda");
        
        
        Produto p = new Produto();
        p.setNome(produto);
        p.setDescricao(desc);
        p.setCategoria(Integer.parseInt(cat));
        p.setCodigoempresa(Integer.parseInt(codE));
        p.setCodigoFornecedor(Integer.parseInt(codF));
        p.setEstoque(Integer.parseInt(estoque));
        p.setPrecocompra(Double.parseDouble(compra));
        p.setPrecocompra(Double.parseDouble(venda));
        
        ProdutoDAO pDao = new ProdutoDAO();
        pDao.inserirProduto(p);
        
        HttpSession sessao = request.getSession();
        sessao.setAttribute("produto", p);
        
        response.sendRedirect(request.getContextPath() + "/cadastroProduto.jsp");
        
    }

    
   

}
