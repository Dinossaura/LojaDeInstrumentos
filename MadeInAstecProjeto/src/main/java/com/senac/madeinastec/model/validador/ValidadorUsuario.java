/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.model.validador;
import com.senac.madeinastec.model.Usuario;
import com.senac.madeinastec.exceptions.ClienteException;
import com.senac.madeinastec.exceptions.UsuarioException;
/**
 *
 * @author Magno
 */
public class ValidadorUsuario {
    public static void validar(Usuario usuario) throws UsuarioException{
        //Realização de Validações de Negocio
        if(usuario == null){
            throw new UsuarioException("Não foi informado um Usuário");
        }
        
        if(usuario.getNome()== null || "".equals(usuario.getNome())){
            throw new UsuarioException("Não foi informado o nome do Usuário");
        }
        
        if(usuario.getLogin()== null || "".equals(usuario.getLogin())){
            throw new UsuarioException("Não foi informado o Login do Usuário");
        }
        
        if (usuario.getSenha()== null
                || "".equals(usuario.getSenha())) {
            throw new UsuarioException("É necessário informar a "
                    + "senha do Usuário");
        }
        
    }
}
