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
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          RequestDispatcher dispatcher
	    = request.getRequestDispatcher("/index.jsp");
    dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Usuario u = new Usuario();
        Usuario verifica = new Usuario();
        ServicoUsuario su = new ServicoUsuario();
        HttpSession sessao = request.getSession();
        
        String usuario = request.getParameter("usuario");
        String senha = request.getParameter("senha");
        String empresa = request.getParameter("empresa");
        
        u.setLogin(usuario);
        u.setSenha(senha);
        u.setCodigoEmpresa(Integer.parseInt(empresa));
        
        try {
            
            verifica = su.retornaUsuario(u); 
        } catch (Exception e) {
            
        }
        
        if (verifica != null){
            sessao.setAttribute("Usuario", usuario);
            response.sendRedirect(request.getContextPath() + "/menu.jsp");
            System.out.println("Nome " + verifica.getNome() + "/n" + "Senha " + verifica.getSenha());
        }else{
            request.setAttribute("mensagemErro", "Usuário ou senha inválido");
            RequestDispatcher dispatcher
	      = request.getRequestDispatcher("/index.jsp");
            dispatcher.forward(request, response);
            System.out.println("Usuário não encontrado!");
        }
        
        
    }

}
