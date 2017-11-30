/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.servlets;

import com.senac.madeinastec.dao.ClienteDAO;
import com.senac.madeinastec.model.Cliente;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "AtualizarClienteServlet", urlPatterns = {"/AtualizarClienteServlet"})
public class AtualizarClienteServlet extends HttpServlet {
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("idEscondido");
        System.out.println(request.getParameter("idEscondido"));
        String nome = request.getParameter("name").toLowerCase();
        String sobrenome = request.getParameter("sobrenome");
        String sexo = request.getParameter("sexo");
        String dataNasc = request.getParameter("dataNasc");
        System.out.println(request.getParameter("dataNasc"));
        String cpf = request.getParameter("cpf");
        String rg = request.getParameter("rg");
        String tel1 = request.getParameter("tel1");
        String tel2 = request.getParameter("tel2");
        String email = request.getParameter("email");
        String numCasa = request.getParameter("numCasa");
        String complemento = request.getParameter("complemento");
        String end = request.getParameter("endereco");
        String cidade = request.getParameter("cidade");
        String cep = request.getParameter("cep");
        String estado = request.getParameter("estados");
        String empresa = request.getParameter("empresa");
        
        Cliente novoCliente = new Cliente();
         
         int s = Integer.parseInt(sexo);
         if(s == 1){
          novoCliente.setSexo("Masculino");  
        }else{
             novoCliente.setSexo("Feminino");
         }
        novoCliente.setId(Integer.parseInt(id));
        novoCliente.setNome(nome);
        novoCliente.setSobrenome(sobrenome);
        novoCliente.setCpf(cpf);
        novoCliente.setIdade(dataNasc);
        novoCliente.setRg(rg);
        novoCliente.setTelefone(tel1);
        novoCliente.setTelefone2(tel2);
        novoCliente.setEmail(email);
        novoCliente.setNumero(numCasa);
        novoCliente.setEndereco(end);
        novoCliente.setComplemento(complemento);
        novoCliente.setCidade(cidade);
        novoCliente.setCep(cep);
        novoCliente.setEstado(estado);
        novoCliente.setEmpresa(1);
        
        ClienteDAO clientedao = new ClienteDAO();
        try {
            clientedao.updateCliente(novoCliente);
        } catch (Exception ex) {
            Logger.getLogger(AtualizarClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
//        HttpSession sessao = request.getSession();
//        sessao.setAttribute("cliente", novoCliente);
        
        response.sendRedirect(request.getContextPath() + "/clientes");
       
    }

    
}
