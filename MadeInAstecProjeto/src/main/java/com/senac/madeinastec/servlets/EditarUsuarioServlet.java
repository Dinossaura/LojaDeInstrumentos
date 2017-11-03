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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author mayra.jpereira
 */
@WebServlet(name = "EditarUsuarioServlet", urlPatterns = {"/EditarUsuarioServlet"})
public class EditarUsuarioServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String destino;

        HttpSession sessao = request.getSession();
        if (sessao.getAttribute("usuario") != null) {
            request.setAttribute("usuario", sessao.getAttribute("usuario"));
            // Remove o atributo da sessao para usuario nao ficar preso na tela de resultados           

            destino = "alterarUsuario.jsp";
        } else {
            destino = "alterarUsuario.jsp";
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher(destino);
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
        HttpSession sessao = request.getSession();

        String id = request.getParameter("idEscondido");

        UsuarioDAO user = new UsuarioDAO();
        Usuario usuario = new Usuario();
        usuario = user.encontrarUmUsuario(Integer.parseInt(id));
        
        
        //Fiz essas condições para pegar os valores em String empresa e função ao invés dos ID's
        //...pois não sei fazer de outra forma :(
        // Se você souber fazer por pesquisa no banco pode alterar o código :)
        
        String funcao;
        String empresa;
        int codEmpresa = usuario.getCodigoEmpresa();
        switch (codEmpresa) {
            case 1:
                empresa = "Matriz - São Paulo";
                break;
            case 2:
                empresa = "Filial - Porto Alegre";
                break;
            default:
                empresa = "Filial - Recife";
                break;
        }
        
        int codFunc = usuario.getcodigoPerfil();
        switch (codFunc) {
            case 1:
                funcao = "Diretoria";
                break;
            case 2:
                funcao = "Gerente Produtos/ Serviços";
                break;
            case 3:
                funcao = "Gerente Vendas";
                break;
            case 4:
                funcao = "Gerente TI";
                break;
            case 5:
                funcao = "Funcionário Retaguarda";
                break;
            case 6:
                funcao = "Vendedor";
                break;
            default:
                funcao = "Suporte Técnico";
                break;
        }
        
        
        request.setAttribute("funcao", funcao);
        request.setAttribute("empresa", empresa);
        request.setAttribute("usuario", usuario);
        RequestDispatcher dispatcher = request.getRequestDispatcher("alterarUsuario.jsp");
        dispatcher.forward(request, response);


         
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
