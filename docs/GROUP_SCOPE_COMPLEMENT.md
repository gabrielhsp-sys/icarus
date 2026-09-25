# Complemento do escopo do grupo

> | Campo | Valor |
> |---|---|
> | Origem | complemento ao documento de escopo, no mesmo Google Doc do grupo |
> | Status | **DECIDIDO (grupo)** em 2026-09-25 |
> | Data do complemento | 25/09/2026 (consta no texto) |
> | Autoria | um integrante escreveu as respostas no grupo e todos concordaram; confirmado por Gabriel em 2026-09-25 |
> | Ata | não existe |
> | Transcrito em | 2026-09-25 |
>
> Este complemento atualiza o documento de escopo transcrito em [`GROUP_SCOPE.md`](GROUP_SCOPE.md).
> Onde os dois diferem, vale o complemento, como o próprio texto diz. O texto abaixo é
> **transcrição fiel**: não foi reescrito, corrigido nem interpretado.
>
> Registro das decisões: [`DECISIONS.md`](DECISIONS.md) G-004 a G-011. O que continua em aberto
> está em [`GROUP-DECISIONS.md`](GROUP-DECISIONS.md#pendente).

## Complemento do grupo

```text
COMPLEMENTO — DECISÕES DO GRUPO (25/09/2026)
Este complemento atualiza o documento acima. Onde houver diferença, vale o complemento.

Elementos 3D
Ícaro, as plataformas e os inimigos são objetos 3D. Os cenários de fundo são 2D.

Estrutura do jogo
Não há fases. O jogo é contínuo: Ícaro sobe sem parar, e o cenário de fundo muda ao longo da subida (Terra/Creta, Cidade, Subida para o céu, Nuvens, Céu).

Final
Não existe vitória. Ao chegar ao céu, o jogo termina com uma cutscene: o sol derrete as asas e Ícaro cai.
Derrota: Ícaro cai das plataformas durante a subida.

Jump de impulso
É uma plataforma do tipo pula-pula.

Flechas e inimigos
Ícaro atira flechas com o clique do mouse. Inimigo atingido morre ou sai da tela.

Controles
A e D movem Ícaro para os lados. O salto é automático. O clique do mouse dispara as flechas.

Checkpoint
Não há checkpoint. A partida dura até chegar ao fim ou perder.

Organização
Cada integrante trabalha em uma branch separada no Git, para não quebrar a branch principal (main).

Ainda em aberto
- Divisão das tarefas por pessoa.
- Duração da partida.
- Quais são os poderes temporários.
- O que aparece depois da cutscene final (ex.: tela com o score).
- O que acontece quando um inimigo atinge Ícaro.
- Como as branches são juntadas na main (quem revisa e aprova).

Engine e linguagem
Godot 4 (versão 4.7.2 para todos) com GDScript. Substitui o "gamepy" e o Python citados acima. Os modelos 3D continuam sendo feitos no Blender.
```
