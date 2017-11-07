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
        
        if((usuario.length() == 0)||(senha.length()==0)||(empresa.length()==0)){
            sessao.setAttribute("erro", "Verifique usuário ou senha!");
            
            request.setAttribute("errologin", "Verifique usuário ou senha");
                RequestDispatcher dispatcher
                = request.getRequestDispatcher("/index.jsp");
                dispatcher.forward(request, response);
        }else{
            try {
                verifica = su.retornaUsuarioLogin(u.getLogin(), u.getSenha(), u.getCodigoEmpresa()); 
            } catch (Exception e) {
            
            }
        
            if (verifica != null) {
                sessao.setAttribute("Usuario", usuario);
                sessao.setAttribute("Empresa", empresa);
                response.sendRedirect(request.getContextPath() + "/menu.jsp");
                System.out.println("Nome " + verifica.getNome() + "/n" + "Senha " + verifica.getSenha());
                sessao.setAttribute("erro", "");
            }else{
                sessao.setAttribute("erro", "Verifique usuário ou senha!");
                request.setAttribute("errologin", "Verifique usuário ou senha!");
                RequestDispatcher dispatcher
                = request.getRequestDispatcher("/index.jsp");
                dispatcher.forward(request, response);
                System.out.println("Usuário não encontrado!");
            }
        }
        
        
        
    }

}
