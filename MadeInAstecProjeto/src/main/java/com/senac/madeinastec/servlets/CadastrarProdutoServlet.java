/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.servlets;

import com.senac.madeinastec.dao.ProdutoDAO;
import com.senac.madeinastec.model.Produto;
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

@WebServlet(name = "CadastrarProdutoServlet", urlPatterns = {"/cadastrar-produto"})
public class CadastrarProdutoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

          RequestDispatcher dispatcher
	    = request.getRequestDispatcher("/cadastroProduto.jsp");
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession sessao = request.getSession();
                
        String produto = request.getParameter("prod");
        String desc = request.getParameter("descProd");
        String cat = request.getParameter("categ");
        String codE = request.getParameter("empresa");
        String fornecedor = request.getParameter("fornecedor");
        String estoque = request.getParameter("estoque");
        String compra = request.getParameter("compra");
        compra = compra.replace(".", "");
        compra = compra.replace(",", ".");
        String venda = request.getParameter("venda");
        venda = venda.replace(".", "");
        venda = venda.replace(",", ".");
        String codigoempresa = (String) sessao.getAttribute("Empresa");
        //Verifica campos obrigatórios
            if((produto.length() == 0)||(desc.length() == 0)||
                    (cat.length() == 0)||(fornecedor.length() == 0)||(estoque.length() == 0)||(compra.length() == 0)||
                    (venda.length() == 0)){
                sessao.setAttribute("mensagemErroCampos", "Verifique campos obrigatórios!");
                RequestDispatcher dispatcher
                = request.getRequestDispatcher("/cadastroProduto.jsp");
                dispatcher.forward(request, response);
            }else{
                 ServicoProduto sp = new ServicoProduto();
                 boolean proexiste = false;
                 try {
                proexiste = sp.encontrarProdutoCadastro(produto, Integer.parseInt(codigoempresa));
                } catch (Exception e) {
                    
                }
                 if(!proexiste){
                     sessao.setAttribute("mensagemErroCampos", "");
                     
                     Produto p = new Produto();
                     p.setNome(produto);
                     p.setDescricao(desc);
                     p.setCategoria(Integer.parseInt(cat));
                     p.setCodigoempresa(Integer.parseInt(codE));
                     p.setCodigoFornecedor(Integer.parseInt(fornecedor));
                     p.setEstoque(Integer.parseInt(estoque));
                     p.setPrecocompra(Double.parseDouble(compra));
                     p.setPrecovenda(Double.parseDouble(venda));
                     
                     //Cadastra novo fornecedor na tabela
                    try {
                        sp.cadastrarProduto(p);
                        sessao.setAttribute("Produto", p);
                        sessao.setAttribute("produtoexiste", "");
                        response.sendRedirect(request.getContextPath() + "/cadastroProduto.jsp");
                        System.out.println("Produto Inserido com sucesso!");
            
                    } catch (Exception e) {
                        request.setAttribute("mensagemErro", "Produto não cadastrado");
                        sessao.setAttribute("produtoexiste", "");
                        RequestDispatcher dispatcher
                        = request.getRequestDispatcher("/cadastroProduto.jsp");
                        dispatcher.forward(request, response);
                        System.out.println("Erro na inserção de novo produto!");
                    }   
                }else{
                     sessao.setAttribute("produtoexiste", "Produto já existe!");
                     request.setAttribute("produtoexiste", "Produto já existe!");
                     RequestDispatcher dispatcher
                     = request.getRequestDispatcher("/cadastroFornecedor.jsp");
                     dispatcher.forward(request, response);
                    System.out.println("Erro na inserção de novo Produto!");
                 }
            }
                

    }
}
