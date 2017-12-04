/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.servlets;

import com.senac.madeinastec.model.Venda;
import com.senac.madeinastec.model.Cliente;
import com.senac.madeinastec.model.ItemVenda;
import com.senac.madeinastec.model.Produto;
import com.senac.madeinastec.service.ServicoVenda;
import com.senac.madeinastec.service.ServicoCliente;
import com.senac.madeinastec.service.ServicoItemVenda;
import com.senac.madeinastec.service.ServicoProduto;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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
@WebServlet(name = "ListagemDeVendasServlet", urlPatterns = {"/listagemvendas"})
public class ListagemDeVendasServlet extends HttpServlet {


     
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServicoVenda sv = new ServicoVenda();
        ServicoProduto sp = new ServicoProduto();
        ServicoCliente scli = new ServicoCliente();
        
        Venda venda = new Venda();
        ItemVenda itemvenda = new ItemVenda();
        
        List<Venda> vendas= new ArrayList<Venda>();
        List<Produto> listaprodutos = new ArrayList<Produto>();
        List<Cliente> listaclientes = new ArrayList<Cliente>();
        
        //Criação se sessão para retorno em tela
        HttpSession sessao = request.getSession();
        
        String datainicial = request.getParameter("datainicial");
        String datafinal = request.getParameter("datafinal");
        String empresa = request.getParameter("empresa");
        boolean vempresa = true;
        
        if(sessao.getAttribute("Usuario") != null){
           if((datainicial.length() == 0)||(datafinal.length() == 0)){
            sessao.setAttribute("datasvazias", "Verifique Datas!");
            sessao.removeAttribute("datamaior");
            response.sendRedirect(request.getContextPath() + "/relatorio.jsp"); 
            
        }else{
            java.sql.Date datasqlinicial = new java.sql.Date(Date.valueOf(datainicial).getTime());
            java.sql.Date datasqlfinal = new java.sql.Date(Date.valueOf(datafinal).getTime());
        
            if ((empresa != "1")||(empresa != "2")||(empresa != "3")){
                vempresa = false;
            }
        
            try {
                if (datasqlinicial.after(datasqlfinal)){
                    sessao.setAttribute("datamaior", "Datas não conferem!"); 
                    sessao.removeAttribute("datasvazias");
                }else{
                //Lista de vendas
                vendas = sv.listavendas(empresa, datasqlinicial, datasqlfinal);
                
                
                sessao.removeAttribute("datamaior");
                sessao.removeAttribute("datasvazias");
                sessao.setAttribute("listavendas", vendas); 
                }
            
            } catch (Exception e) {
            
            }
        
        
            response.sendRedirect(request.getContextPath() + "/relatorio.jsp");   
        } 
        }
        response.sendRedirect(request.getContextPath() + "/relatorio.jsp"); 
    }

}
