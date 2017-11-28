/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.servlets;

import com.senac.madeinastec.dao.ProdutoDAO;
import com.senac.madeinastec.model.Carrinho;
import com.senac.madeinastec.model.Produto;
import com.senac.madeinastec.service.ServicoCarrinho;
import com.senac.madeinastec.service.ServicoItemCarrinho;
import com.senac.madeinastec.service.ServicoProduto;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "CadastrarItemCarrinhoServlet", urlPatterns = {"/cadastraritemcarrinho"})
public class CadastrarItemCarrinhoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession sessao = request.getSession();
        ServicoItemCarrinho sic = new ServicoItemCarrinho();
        ServicoCarrinho sc = new ServicoCarrinho();
        
        ServicoProduto sp = new ServicoProduto();
        Produto produto = new Produto();
        Carrinho carrinho = new Carrinho();
        
        String codigocarrinho = request.getParameter("codigocarrinho");
        String codigoproduto = request.getParameter("codigoproduto");
        String quantidade = request.getParameter("qtdProd");
        String codigoempresa = (String) sessao.getAttribute("Empresa");
        
        if (quantidade.length() == 0){
            sessao.setAttribute("quantidadevazia", "Verifique quantidade da inclusão!");
            sessao.setAttribute("produtoqtdvazia", codigoproduto);
            RequestDispatcher dispatcher
	      = request.getRequestDispatcher("/venda.jsp");
            dispatcher.forward(request, response);
        }else{
            try {
                //Retorna Produto da base da dados
                produto = sp.encontrarProdutoPorCodigo(Integer.parseInt(codigoproduto), Integer.parseInt(codigoempresa));
                
                //Retorna Carrinho da Base de dados
                carrinho = sc.retornaCarrinho(Integer.parseInt(codigocarrinho));
                
                //Altera Valor do Carrinho
                sc.alteraValorCarrinho((produto.getPrecovenda() * Integer.parseInt(quantidade)) + carrinho.getValorTotal());
                
                //Verifica disponibilidade do estoque
                if(produto.getEstoque() < Integer.parseInt(quantidade)){
                  sessao.setAttribute("estoqueinsuficiente", "Verifique a quantidade do estoque");
                  sessao.setAttribute("produtoestoqueinsuficiente", codigoproduto);
                }else{
                    //Atualiza estoque
                    sp.atualizaEstoque(produto.getCodigo(), produto.getEstoque()-Integer.parseInt(quantidade));    
                    //Cadastrar Item no Carrinho especificado
                    sic.cadastraritemCarrinho(Integer.parseInt(codigocarrinho), Integer.parseInt(codigoproduto), Integer.parseInt(quantidade));
                    sessao.removeAttribute("produtoqtdvazia");
                    sessao.removeAttribute("estoqueinsuficiente");
                }
                
            } catch (Exception e) {
            }
            response.sendRedirect(request.getContextPath() + "/venda.jsp");
        
        }

    }
}
