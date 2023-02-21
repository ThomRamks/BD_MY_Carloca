package carloca.entities;

import javax.persistence.*;

@Entity
@Table(name = "OPCIONAIS")
public class Opcionais {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "DIRECAO_ELETRICA")
    private boolean direcaoEletrica;
    private boolean ar;
    private boolean radio;
    private boolean sensor;
    private boolean camera;
    @Column(name = "NOME_TIPO")
    private String nomeTipo;

    @Override
    public String toString() {
        return nomeTipo;
    }
}
