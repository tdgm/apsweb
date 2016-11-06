package br.edu.unicarioca.DAO;

import java.util.ArrayList;
import java.util.List;


public class Aluno {

    public int getMatricula() {
        return matricula;
    }

    public void setMatricula(int matricula) {
        this.matricula = matricula;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public List<Boolean> getListaPresencas() {
        return listaPresencas;
    }

    public void setListaPresencas(List<Boolean> listaPresencas) {
        this.listaPresencas = listaPresencas;
    }
    
    private int matricula;
    private String nome;
    private List<Boolean> listaPresencas = new ArrayList<Boolean>();
}