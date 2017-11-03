/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.servlets;

import com.senac.madeinastec.dao.ClienteDAO;
import com.senac.madeinastec.dao.UsuarioDAO;
import com.senac.madeinastec.model.Cliente;
import com.senac.madeinastec.model.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author Debaza
 */
@WebServlet(name = "EditarClienteServlet", urlPatterns = {"/editar-cliente"})
public class EditarClienteServlet extends HttpServlet {


 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String id = request.getParameter("idEscondido");
        
        ClienteDAO cd = new ClienteDAO();       
        Cliente cliente = new Cliente();
        try {
            cliente = cd.encontrarClientePorId(Integer.parseInt(id));
        } catch (Exception ex) {
            Logger.getLogger(EditarClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        request.setAttribute("cliente", cliente);        
        RequestDispatcher dispatcher = request.getRequestDispatcher("alterarCliente.jsp");
        dispatcher.forward(request, response); 
        
        
        
    }   

}
