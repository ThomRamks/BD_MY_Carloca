package carloca.entities;

import javax.persistence.*;

@Entity
@Table(name = "STATUS_CARRO")
public class StatusCarro {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @OneToOne (cascade = CascadeType.MERGE)
    @JoinColumn(name = "ID_CARRO")
    private Carro idCarro;
    private String situacao;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Carro getIdCarro() {
        return idCarro;
    }

    public void setIdCarro(Carro idCarro) {
        this.idCarro = idCarro;
    }

    public String getSituacao() {
        return situacao;
    }

    public void setSituacao(String situacao) {
        this.situacao = situacao;
    }

}
