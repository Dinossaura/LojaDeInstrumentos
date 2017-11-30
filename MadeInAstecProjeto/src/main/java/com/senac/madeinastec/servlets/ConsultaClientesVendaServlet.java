/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.servlets;

import com.senac.madeinastec.dao.ClienteDAO;
import com.senac.madeinastec.model.Cliente;
import com.senac.madeinastec.service.ServicoCliente;
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
 * @author Mayra Pereira
 */
@WebServlet(name = "ConsultaClientesVendaServlet", urlPatterns = {"/ConsultaClientesVendaServlet"})
public class ConsultaClientesVendaServlet extends HttpServlet {

   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
          HttpSession sessao = request.getSession();  
          ArrayList<Cliente> Lista = new ArrayList();
          ServicoCliente sc = new ServicoCliente();
          String codigoempresa = (String) sessao.getAttribute("Empresa");
          
          try {
            Lista = (ArrayList<Cliente>) sc.procurarCliente("", Integer.parseInt(codigoempresa));
        } catch (Exception e) {
        }
        
          sessao.setAttribute("ListaClientes", Lista);
          
          RequestDispatcher dispatcher
	    = request.getRequestDispatcher("/venda.jsp");
    dispatcher.forward(request, response);
        
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Cliente c = new Cliente();
        
       
        List<Cliente> Lista = new ArrayList();
        
       
        ServicoCliente sc = new ServicoCliente();
        
       
        HttpSession sessao = request.getSession();
        
       
        String cliente = request.getParameter("cpfCliente");
        String codigoempresa = (String) sessao.getAttribute("Empresa");
        
        try {
            if(cliente.length() != 0){
               c = sc.obterClientePorCpf(cliente, Integer.parseInt(codigoempresa));
                Lista.add(c); 
            }else{
                Lista = sc.listarClientes(Integer.parseInt(codigoempresa));
            }
            
           
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        sessao.setAttribute("ListaClientes", Lista);
        response.sendRedirect(request.getContextPath() + "/venda.jsp");
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
