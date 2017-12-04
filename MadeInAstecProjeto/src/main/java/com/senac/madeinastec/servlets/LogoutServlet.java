/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.servlets;

import com.senac.madeinastec.dao.UsuarioDAO;
import com.senac.madeinastec.exceptions.ClienteException;
import com.senac.madeinastec.exceptions.DataSourceException;
import com.senac.madeinastec.exceptions.UsuarioException;
import com.senac.madeinastec.model.Usuario;
import com.senac.madeinastec.service.ServicoUsuario;
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
 * @author magno
 */
@WebServlet(name = "LogoutServlet", urlPatterns = {"/logout"})
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          HttpSession sessao = request.getSession();
        
          sessao.invalidate();
          
          RequestDispatcher dispatcher
	    = request.getRequestDispatcher("/index.jsp");
    dispatcher.forward(request, response);
    response.sendRedirect(request.getContextPath() + "/index.jsp"); 

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
        
}
