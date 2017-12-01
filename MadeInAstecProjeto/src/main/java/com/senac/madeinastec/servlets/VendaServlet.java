/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.servlets;

import com.senac.madeinastec.model.Carrinho;
import com.senac.madeinastec.model.Cliente;
import com.senac.madeinastec.model.ItemCarrinho;
import com.senac.madeinastec.model.ItemVenda;
import com.senac.madeinastec.model.Produto;
import com.senac.madeinastec.model.Venda;
import com.senac.madeinastec.service.ServicoCarrinho;
import com.senac.madeinastec.service.ServicoCliente;
import com.senac.madeinastec.service.ServicoItemCarrinho;
import com.senac.madeinastec.service.ServicoItemVenda;
import com.senac.madeinastec.service.ServicoProduto;
import com.senac.madeinastec.service.ServicoVenda;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
@WebServlet(name = "VendaServlet", urlPatterns = {"/finalizarvenda"})
public class VendaServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession sessao = request.getSession();
        ServicoCarrinho sc = new ServicoCarrinho();
        ServicoVenda sv = new ServicoVenda();
        ServicoItemVenda siv = new ServicoItemVenda();
        ServicoItemCarrinho sic = new ServicoItemCarrinho();
        ServicoProduto sp = new ServicoProduto();
        ServicoCliente scli = new ServicoCliente();
        
        String codigocarrinho = request.getParameter("codigocarrinho");
        String codigoempresa = (String) sessao.getAttribute("Empresa");
        
        Carrinho carrinho = new Carrinho();
        ItemCarrinho itemcarrinho = new ItemCarrinho();
        ItemVenda itemvenda = new ItemVenda();
        Venda venda = new Venda();
        Cliente cliente = new Cliente();
        
        List<ItemCarrinho> listaitens= new ArrayList<ItemCarrinho>();
        List<Produto> listaprodutos = new ArrayList<Produto>();
        List<Cliente> listaclientes = new ArrayList<Cliente>();
        
        try {
            //Retorna lista de itens do carrinho
            listaitens = sic.listarItensCarrinho(Integer.parseInt(codigocarrinho));
            
            //Retorna topo do carrinho (dados que não se alteram)
            carrinho = sc.retornaCarrinho(Integer.parseInt(codigocarrinho));
            
            //Lista todos os produtos da empresa
            listaprodutos = sp.listarProdutos(Integer.parseInt(codigoempresa));
            
            Date data = new Date();
            java.sql.Date datasql = new java.sql.Date(data.getTime());
            
            //Atribuindo valores do carrinho para a venda
            venda.setCliente(carrinho.getCodigoCliente());
            venda.setData(datasql);
            venda.setValorTotal(carrinho.getValorTotal());
            venda.setEmpresa(Integer.parseInt(codigoempresa));
            
            //Cadastro de Cabeçario de Venda
            int codigovenda = sv.cadastrarVenda(venda);
            venda.setCodigo(codigovenda);
            
            //Cadastra Itens na Venda
            for(int i = 0; i < listaitens.size(); i++){
                itemvenda.setCodigoVenda(codigovenda);
                itemvenda.setCodigoProduto(listaitens.get(i).getProduto());
                itemvenda.setQuantidade(listaitens.get(i).getQuantidade());
                
                siv.cadastraritemVenda(itemvenda.getCodigoVenda(), itemvenda.getCodigoProduto(), itemvenda.getQuantidade());
            }
            
            
            //Esvazia ItemCarrinho
            sic.excluirCarrinho(Integer.parseInt(codigocarrinho));
            
            //Esvazia Carrinho
            sc.excluirCarrinho(Integer.parseInt(codigocarrinho));
            
            //Retorna Cliente da Venda
            cliente = scli.obterClientePorCodigo(venda.getCliente(), Integer.parseInt(codigoempresa));
            
        } catch (Exception e) {
        }
        
        sessao.setAttribute("venda", venda);
        sessao.setAttribute("clientevenda", cliente);
        sessao.removeAttribute("codigocarrinho");
        
        response.sendRedirect(request.getContextPath() + "/finalizarVenda.jsp");
    }

}
