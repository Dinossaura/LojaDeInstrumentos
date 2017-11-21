package com.senac.madeinastec.servlets;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.senac.madeinastec.model.Fornecedor;
import com.senac.madeinastec.service.ServicoFornecedor;
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
 * @author magno
 */
@WebServlet(name = "CadastrarFornecedorServlet", urlPatterns = {"/cadastro-fornecedor"})
public class CadastrarFornecedorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          request.setCharacterEncoding("UTF-8");
          HttpSession sessao = request.getSession();
        
        String fornecedor = request.getParameter("fornecedor");
        String empresa = request.getParameter("empresa");
        String endereco = request.getParameter("endereco");
        String numero = request.getParameter("numero");
        String complemento = request.getParameter("complemento");
        String cidade = request.getParameter("cidade");
        String estado = request.getParameter("estados");
        String telefone = request.getParameter("telefone");
        
        //Verifica se campos obrigatórios foram digitados na tela de cadastro ou alteração
        if((fornecedor.length() <= 0)||(empresa.length() <= 0)||(endereco.length() <= 0)||(numero.length() <= 0)||
                (cidade.length() == 0)||(estado.length() == 0)){
            sessao.setAttribute("mensagemErroCampos", "Verifique campos obrigatórios!");
            RequestDispatcher dispatcher
	      = request.getRequestDispatcher("/cadastroFornecedor.jsp");
            dispatcher.forward(request, response);
        }else{
            ServicoFornecedor sf = new ServicoFornecedor();
            boolean fexiste = false;
            try {
                fexiste = sf.retornafornecedorNome(fornecedor, Integer.parseInt(empresa));
            } catch (Exception e) {
            }
            
            //Verifica se já existe fornecedor na tabela
            if(!fexiste){
                sessao.setAttribute("mensagemErroCampos", "");
                Fornecedor forne = new Fornecedor();
                forne.setNome(fornecedor);
                forne.setCodigoempresa(Integer.parseInt(empresa));
                forne.setEndereco(endereco);
                forne.setNumero(numero);
                forne.setComplemento(complemento);
                forne.setCidade(cidade);
                forne.setEstado(estado);
                forne.setTelefone(telefone);
                
                //Cadastra novo fornecedor na tabela
                try {
                    sf.cadastrarFornecedor(forne);
                    sessao.setAttribute("Fornecedor", forne);
                    sessao.setAttribute("fornecedorexiste", "");
                    response.sendRedirect(request.getContextPath() + "/cadastroFornecedor.jsp");
                    System.out.println("Fornecedor Inserido com sucesso!");
            
                } catch (Exception e) {
                    request.setAttribute("mensagemErro", "Fornecedor não cadastrado");
                    sessao.setAttribute("fornecedorexiste", "");
                    RequestDispatcher dispatcher
                    = request.getRequestDispatcher("/cadastroFornecedor.jsp");
                    dispatcher.forward(request, response);
                    System.out.println("Erro na inserção de novo fornecedor!");
                }     
            }else{
                sessao.setAttribute("fornecedorexiste", "Fornecedor já existe!");
                request.setAttribute("fornecedorexiste", "Fornecedor já existe!");
                RequestDispatcher dispatcher
                = request.getRequestDispatcher("/cadastroFornecedor.jsp");
                dispatcher.forward(request, response);
                System.out.println("Erro na inserção de novo fornecedor!");
            }
        
       }
          
        
    }

}