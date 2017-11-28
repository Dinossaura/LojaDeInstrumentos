/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.servlets;


import com.senac.madeinastec.model.ItemCarrinho;
import com.senac.madeinastec.model.Produto;
import com.senac.madeinastec.service.ServicoCarrinho;
import com.senac.madeinastec.service.ServicoCliente;
import com.senac.madeinastec.service.ServicoItemCarrinho;
import com.senac.madeinastec.service.ServicoProduto;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "ExcluirClienteCarrinhoServlet", urlPatterns = {"/removerclientecarrinho"})
public class ExcluirClienteCarrinhoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //Instância serviço de servidor para efetuar consulta e ligação com ClienteDAO
        ServicoCarrinho sc = new ServicoCarrinho();
        ServicoItemCarrinho sic = new ServicoItemCarrinho();
        ServicoProduto sp = new ServicoProduto();
        Produto produto = new Produto();
        List<ItemCarrinho> lista= new ArrayList<ItemCarrinho>();
        
        //Criação se sessão para retorno em tela
        HttpSession sessao = request.getSession();
        String codigocarrinho = request.getParameter("codigocarrinho");
        String codigoempresa = (String) sessao.getAttribute("Empresa");
        
        //Lista itens do carrinho
        try {
            lista = sic.listarItensCarrinho(Integer.parseInt(codigocarrinho));
        } catch (Exception e) {
        }
        
        //Devolve posições do estoque após cancelamento do carrinho
        for(int i = 0; i < lista.size(); i++){
            try {
                //Retorna produto especifico da Lista de Itens do Carrinho
                produto = sp.encontrarProdutoPorCodigo(lista.get(i).getProduto(), Integer.parseInt(codigoempresa));
                
                //Devolve valor do estoque
                sp.atualizaEstoque(lista.get(i).getProduto(), produto.getEstoque() + lista.get(i).getQuantidade());
            } catch (Exception e) {
            }
            
        }

        try {
            sic.excluirCarrinho(Integer.parseInt(codigocarrinho));
            sc.excluirCarrinho(Integer.parseInt(codigocarrinho));
        } catch (Exception e) {
        }
        
        sessao.setAttribute("carrinhoexcluido", codigocarrinho);
        sessao.removeAttribute("codigocarrinho");
        
        response.sendRedirect(request.getContextPath() + "/venda.jsp");

        }
           
        
}


