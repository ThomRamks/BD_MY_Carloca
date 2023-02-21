package carloca.entities;

import javax.persistence.*;

@Entity
@Table(name = "UNIDADES_CARLOCA")
public class UnidadeCarloca {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column (name = "NOME_UNIDADE")
    private String nomeUnidade;
    @OneToOne (cascade = CascadeType.MERGE)
    @JoinColumn (name = "ID_ENDERECO")
    private Endereco idEndereco;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNomeUnidade() {
        return nomeUnidade;
    }

    public void setNomeUnidade(String nomeUnidade) {
        this.nomeUnidade = nomeUnidade;
    }

    public Endereco getIdEndereco() {
        return idEndereco;
    }

    public void setIdEndereco(Endereco idEndereco) {
        this.idEndereco = idEndereco;
    }


}
