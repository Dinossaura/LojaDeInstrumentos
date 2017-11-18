/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.servlets;

import com.senac.madeinastec.dao.UsuarioDAO;
import com.senac.madeinastec.model.Usuario;
import com.senac.madeinastec.service.ServicoUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author victor.wdebaza
 */
@WebServlet(name = "CadastrarUsuarioServlet", urlPatterns = {"/cadastro-usuario"})
public class CadastrarUsuarioServlet extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         RequestDispatcher dispatcher
	    = request.getRequestDispatcher("/cadastroUsuario.jsp");
        dispatcher.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession sessao = request.getSession();
        
        String nome = request.getParameter("name").toUpperCase();
        String codigoEmpresa = request.getParameter("empresa");
        String codigoperfil = request.getParameter("perfil");
        String login= request.getParameter("login").toUpperCase();
        String senha= request.getParameter("senha");
        
        //if para verificação de campos obrigatórios
        if((nome.length()== 0)||(codigoEmpresa.length()==0)||(codigoperfil.length()==0)||(login.length()==0)||(senha.length()==0)){
            sessao.setAttribute("mensagemErroCampos", "Verifique campos obrigatórios!");
            RequestDispatcher dispatcher
	      = request.getRequestDispatcher("/cadastroUsuario.jsp");
            dispatcher.forward(request, response);    
        }else{
            sessao.setAttribute("mensagemErroCampos", "");
            Usuario novoUsuario = new Usuario();
            novoUsuario.setNome(nome);
            novoUsuario.setLogin(login);
            novoUsuario.setSenha(senha);
            novoUsuario.setCodigoEmpresa(Integer.parseInt(codigoEmpresa));
            novoUsuario.setcodigoPerfil(Integer.parseInt(codigoperfil));
            
            ServicoUsuario su = new ServicoUsuario();
            
            boolean uexiste = false;//Verifica se login de usuário já existe
            try {
                uexiste = su.retornaUsuario(novoUsuario.getLogin(), novoUsuario.getCodigoEmpresa());
            } catch (Exception e) {
            }
            
            if(!uexiste){
               try {
                su.cadastrarUsuario(novoUsuario);
                sessao.setAttribute("Usuario", novoUsuario);
                sessao.setAttribute("usuarioexiste", "");
                response.sendRedirect(request.getContextPath() + "/cadastroUsuario.jsp");
                System.out.println("Usuário Inserido com sucesso!");
            
               } catch (Exception e) {
                   sessao.setAttribute("usuarioexiste", "");
                request.setAttribute("mensagemErro", "Usuário não cadastrado");
                RequestDispatcher dispatcher
                = request.getRequestDispatcher("/cadastroUsuario.jsp");
                dispatcher.forward(request, response);
                System.out.println("Erro na inserção de novo usuário!");
                } 
            }else{
                sessao.setAttribute("usuarioexiste", "Usuário já existe!");
                request.setAttribute("usuarioexiste", "Usuário já existe!");
                RequestDispatcher dispatcher
                = request.getRequestDispatcher("/cadastroUsuario.jsp");
                dispatcher.forward(request, response);
                System.out.println("Erro na inserção de novo fornecedor!");
            }
            
        }
        
        
        
        

    }

}
