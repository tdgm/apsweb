/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.unicarioca.DAO;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

/**
 *
 * @author podgorski
 */
public class MockingAluno {
    
    public MockingAluno(){
        alunos = listar();
    }
    
    private  List<Aluno> alunos;
    private int itemBusca = 0;
    
    
    
    public List<Aluno> getLista() {
        return buscarAluno(itemBusca);
    }
    
    
    
    public void setItemBusca(int termo) {
        this.itemBusca = termo;
    }
    
    private List<Aluno> listar(){
        List<Aluno> listaAlunos = new ArrayList<Aluno>();
        
        //Alterar para o caminho interno de sua maquina
        String csvFile = "C:\\_Estudos\\unicarioca\\apsweb\\alunos.csv";
        BufferedReader br = null;
        String line = "";
        String cvsSplitBy = ",";
        
        try {

            br = new BufferedReader(new FileReader(csvFile));
            while ((line = br.readLine()) != null) {

                // use comma as separator
                String[] linhaAluno = line.split(cvsSplitBy);

                Aluno aluno = new Aluno();
                aluno.setNome(linhaAluno[1]);
                aluno.setMatricula(Integer.parseInt(linhaAluno[0]));
                aluno.setListaPresencas(simulaPresencas(10));
                listaAlunos.add(aluno);
  
            }

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        
        
        return listaAlunos;
    }
    
        public List<Aluno> buscarAluno(int termo){
        
            
       List<Aluno> alunoBusca = new ArrayList<Aluno>();
        if (termo != 0){
            
            for (Aluno aluno : alunos){
                 
                if (aluno.getMatricula() == termo){
 
                    alunoBusca.add(aluno);
                }
            }
        }else{
            alunoBusca = alunos;
        }
        
        return alunoBusca;
    }
    
    public List<Boolean> simulaPresencas(Integer quantidadeAulas){
        List<Boolean> simulaPresencas = new ArrayList<Boolean>();
        Random random = new Random();
        for (int i = 0; i < quantidadeAulas;i++){
            simulaPresencas.add(random.nextBoolean());
        }
        return simulaPresencas;
                
    }
}
