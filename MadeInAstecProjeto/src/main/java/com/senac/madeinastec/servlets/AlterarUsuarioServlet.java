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
@WebServlet(name = "AlterarUsuarioServlet", urlPatterns = {"/alterarusuario"})
public class AlterarUsuarioServlet extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher
	    = request.getRequestDispatcher("/consultarUsuario.jsp");
        dispatcher.forward(request, response);
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        /*String nome = request.getParameter("editUsuario");
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
        
         response.sendRedirect(request.getContextPath() + "/usuarios");*/
         //Instância Objeto Fornecedor
         
        Usuario usuario = new Usuario();
        
        //Instância serviço de servidor para efetuar consulta e ligação com FornecedorDAO
        ServicoUsuario su = new ServicoUsuario();
        
        //Criação se sessão para retorno em tela
        HttpSession sessao = request.getSession();
        
        //Para verificação se é alteração
        String alteracao = "";
        try {
            alteracao = sessao.getAttribute("Altera").toString();
        } catch (Exception e) {
        }
        
        
        if ((alteracao == null)||(alteracao.length() == 0)){
              //Atribuição de valores digitados na tela de fornecedor e código da empresa
            String codigoUsuario = request.getParameter("codigousuario");
            String codigoempresa = (String) sessao.getAttribute("Empresa");
            
            try {
            usuario = su.retornaUsuario(Integer.parseInt(codigoUsuario), Integer.parseInt(codigoempresa));
            } catch (Exception e) {
            }
        
            sessao.setAttribute("usu", usuario);
            sessao.setAttribute("Altera", "alteracao");
            response.sendRedirect(request.getContextPath() + "/cadastroUsuario.jsp");
        }else{
            Usuario u = new Usuario();
            u = (Usuario) sessao.getAttribute("usu");
            
            //Recupera dados digitados na tela para alteração
            String nomeUsuario = request.getParameter("nomeUsuario").toUpperCase();
            String loginUsuario = request.getParameter("loginUsuario").toUpperCase();
            String senhaUsuario = request.getParameter("senhaUsuario");
            String perfilUsuario = request.getParameter("perfilUsuario");
            
            //Recupera dados não alteraveis da tela de consulta
            int codigo = u.getCodigo();
            int codigoempresa = u.getCodigoEmpresa();
            
           //if para verificação de campos obrigatórios
            if((nomeUsuario.length()== 0)||(String.valueOf(codigoempresa).length())==0||(perfilUsuario.length()==0)||(loginUsuario.length()==0)||(senhaUsuario.length()==0)){
                sessao.setAttribute("mensagemErroCampos", "Verifique campos obrigatórios!");
                RequestDispatcher dispatcher
                = request.getRequestDispatcher("/cadastroUsuario.jsp");
                dispatcher.forward(request, response);  
            }else{
                sessao.setAttribute("mensagemErroCampos", "");
                 try {
                    usuario.setCodigo(codigo);
                    usuario.setCodigoEmpresa(codigoempresa);
                    usuario.setNome(nomeUsuario);
                    su.atualizarUsuario(codigo, codigoempresa, Integer.parseInt(perfilUsuario), nomeUsuario, loginUsuario, senhaUsuario);
                 } catch (Exception e) {
                 }
                response.sendRedirect(request.getContextPath() + "/consultarUsuario.jsp");
                sessao.setAttribute("Altera", "");
            }
           
        }
           
       
    }
    
}
