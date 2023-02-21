package carloca.entities;

import javax.persistence.*;

@Entity
@Table(name = "HISTORICO_LOCACOES")
public class HistoricoLocacoes {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @OneToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "ID_DEVOLUCAO")
    private DadosDevolucao idDevolucao;
    @Column(name ="KM_RODADO")
    private Integer kmRodado;
    @Column(name ="VALOR_FINAL")
    private Integer valorFinal;


    public Integer getId() {
        return id;
    }

    public DadosDevolucao getIdDevolucao() {
        return idDevolucao;
    }

    public Integer getKmRodado() {
        return kmRodado;
    }

    public Integer getValorFinal() {
        return valorFinal;
    }

}
