/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.servlets;

import com.senac.madeinastec.dao.UsuarioDAO;
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
 * @author Mayra Pereira
 */
@WebServlet(name = "AlterarUsuarioServlet", urlPatterns = {"/AlterarUsuarioServlet"})
public class AlterarUsuarioServlet extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher
	    = request.getRequestDispatcher("/alterarUsuario.jsp");
        dispatcher.forward(request, response);
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nome = request.getParameter("editUsuario");
        String login = request.getParameter("editLogin");
        String senha = request.getParameter("editSenha");
        String idUsuario = request.getParameter("idDoUsuario");
        String idFunc = request.getParameter("idDaFuncao");
        String idEmpresa = request.getParameter("idDaEmpresa");
        
        Usuario novoUsuario = new Usuario();
        novoUsuario.setCodigo(Integer.parseInt(idUsuario));
        novoUsuario.setNome(nome);
        novoUsuario.setLogin(login);
        novoUsuario.setCodigoEmpresa(Integer.parseInt(idEmpresa));
        novoUsuario.setcodigoPerfil(Integer.parseInt(idFunc));
        novoUsuario.setSenha(senha);
        
        UsuarioDAO user = new UsuarioDAO();
        
        try {
            user.updateUsuario(novoUsuario);
        } catch (Exception ex) {
            Logger.getLogger(AlterarUsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
       
        
        
        
       
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
