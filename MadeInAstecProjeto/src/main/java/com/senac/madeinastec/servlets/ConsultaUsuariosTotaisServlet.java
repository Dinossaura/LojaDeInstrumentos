/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.servlets;

import com.senac.madeinastec.dao.UsuarioDAO;
import com.senac.madeinastec.exceptions.UsuarioException;
import com.senac.madeinastec.exceptions.DataSourceException;
import com.senac.madeinastec.model.Usuario;
import com.senac.madeinastec.service.ServicoUsuario;
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
 * @author magno
 */
@WebServlet(name = "ConsultaFornecedorServlet", urlPatterns = {"/consultausuariostotais"})
public class ConsultaUsuariosTotaisServlet extends HttpServlet {

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
        //Instância Objeto Fornecedor
        Usuario u = new Usuario();
        
        //Instância de ArrayList para acumular fornecedores
        ArrayList<Usuario> Lista = new ArrayList();
        
        //Instância serviço de servidor para efetuar consulta e ligação com FornecedorDAO
        ServicoUsuario su = new ServicoUsuario();
        
        //Criação se sessão para retorno em tela
        HttpSession sessao = request.getSession();
        
        //Atribuição de valores digitados na tela de fornecedor e código da empresa
        String usuario = request.getParameter("usuarios");
        String codigoempresa = (String) sessao.getAttribute("Empresa");
        
        try {
            Lista = (ArrayList<Usuario>) su.listarUsuarios(usuario, Integer.parseInt(codigoempresa));
        } catch (Exception e) {
        }
        
        sessao.setAttribute("listaUsuario", Lista);
        response.sendRedirect(request.getContextPath() + "/consultarUsuario.jsp");   
        
    }

}
