---
name: make-firac
description: Design e implementa filtros digitais FIR (Finite Impulse Response) para áudio e telecomunicações.
usage: "echo 'Tipo de filtro: lowpass; Janela: Kaiser; N=5' | fabric -p make_firac -g=pt-br"
license: MIT
compatibility: opencode,claude
metadata:
  author: peixoto-ops
  version: 1.0.0
  category: legal
  requires: fabric-cli
  pattern: make_firac
  output_format: markdown
---

# Make FIRAC Skill

Esta skill atua como um **Digital Filter Designer**, projetando e implementando filtros digitais FIR (Finite Impulse Response) para aplicações em áudio e telecomunicações. Ela utiliza o pattern `make_firac` para especificar tipos de filtros, janelas, parâmetros e obter coeficientes calculados.

## 🛠️ Sobre as Ferramentas

### 1. O Motor: Fabric
* **Repo Oficial:** [danielmiessler/fabric](https://github.com/danielmiessler/fabric)

### 2. O Cérebro: Custom Patterns
* **Repo Fonte:** [peixoto-ops/costum_patterns](https://github.com/peixoto-ops/costum_patterns)
* **Pattern Alvo:** `make_firac`

## 🎯 Como Utilizar

Esta skill é ideal para projetar filtros digitais FIR para telecomunicações, áudio e processamento de sinal, especificando:

- **Tipo de filtro**: lowpass (passa-baixa), highpass (passa-alta), bandpass (rejeita faixas)
- **Janelas de atenuação**: Kaiser, Hamming, Blackman
- **Número de coeficientes (N)**: Tamanho do filtro FIR
- **Resposta em dB**: Amplitude em dB para cálculo da resposta
- **Tipo de resposta**: Tipo I, Tipo II ou Tipo III

### Comandos Padrão

```bash
# Filtro simples - 5 coeficientes
echo "lowpass; Kaiser; N=5" | fabric -p make_firac -g=pt-br

# Filtro passa-banda
echo "highpass; Blackman; N=3" | fabric -p make_firac -g=pt-br

# Filtro para análise espectral
echo "lowpass; Hamming; N=10; dB=80" | fabric -p make_firac -g=pt-br

# Salvar especificação
cat filtro.txt | fabric -p make_firac -g=pt-br > especificacao_fir.md
```

## 📊 Formato de Saída

A skill gera especificações técnicas para filtros FIR estruturadas em 6 seções principais:

1. **Identificação do Filtro**: Tipo, N, janela, resposta dB
2. **Características da Resposta**: Largura de banda, ripple, overshoot, settling time
3. **Especificações de Fase**: Coeficientes calculados, valores em dB
4. **Implementação**: Estrutura de coeficientes, biblioteca Python recomendada
5. **Validação e Testes**: Procedimentos de verificação
6. **Documentação**: Como usar os coeficientes em sistemas reais

### Exemplo de Output

```markdown
## Identificação do Filtro

- **Tipo de Filtro**: lowpass (passa-baixa)
- **Janela de Atenuação**: Kaiser
- **Número de Coeficientes (N)**: 5
- **Resposta em dB**: 80 dB (amplitude linear)

## Características da Resposta

- **Largura de Banda**: 1500 Hz (-3 dB @ 1500 Hz)
- **Ripple**: 40 dB (máximo aceitável)
- **Overshoot**: 20 dB (abaixo do limite)
- **Settling Time**: 5 ms (conforme ITU-T G.711)

## Especificações de Fase

| Índice | Valor (dB) | Valor Linear | Descrição |
|--------|------------|-------------|-----------|
| 0 | 0 | 1.0 | DC gain |
| 1 | -5 | 0.56 | Stopband -5 dB |
| 2 | -10 | 0.32 | Stopband -10 dB |
| 3 | -20 | 0.10 | Stopband -20 dB |
| 4 | -30 | 0.03 | Passband -30 dB |
| 5 | -40 | 0.01 | Passband -40 dB |

## Implementação

**Biblioteca Recomendada:** `easy-fir-filter` ([memovalverd42/easy_fir_filter](https://github.com/memovalverd42/easy_fir_filter))

**Estrutura de Coeficientes em Python:**
```python
import numpy as np

# Coeficientes FIR
coeffs = [h[0], h[1], h[2], h[3], h[4], h[5]]

# Criar array numpy para coeficientes
coef_array = np.array(coeffs)

# Calcular resposta
def fir_response(audio, coeffs):
    result = np.zeros(1)  # Resposta impulso
    
    for n in range(len(coeffs)):
        if n > 0:
            # Convolução do sinal de entrada com coeficiente h[n-1]
            result += np.convolve(audio, np.array([coeffs[n-1]]))
        else:
            result += audio * coeffs[0]
    
    return result[0]

# Normalização para dB
def db_scale(audio, max_db=96):
    max_val = np.max(np.abs(audio))
    return 20 * np.log10(max_val / 32768)
```

## Validação e Testes

### Validação de Coeficientes
- Verificar se a soma dos coeficientes é próxima de 1 (estabilidade)
- Garantir que a resposta permanece no domínio [-1, 1]
- Testar com sinais reais para verificar atenuação

### Testes de Resposta
- Medir nível de sinal de saída no limite de passband
- Verificar se não há distorção excessiva (overshoot > 3 dB)
- Calcular fator de escala e comparar com especificação

## Documentação de Uso

### Como Implementar em Sistema Real

1. **Em Hardware (DSP/FPGA):**
   - Armazenar coeficientes em memória
   - Implementar operações de convolução em ponto fixo
   - Normalizar saída para 16 bits

2. **Em Software (Python + NumPy):**
   - Usar biblioteca `easy-fir-filter` para design
   - Implementar filtros em Python puro ou usar NumPy para performance
   - Gerar código C otimizado se necessário para tempo real

3. **Integração com Sistemas de Áudio:**
   - Configurar taxa de amostragem conforme especificação (ex: 8000 Hz, 16000 Hz)
   - Calcular ganho de resposta (DC gain)
   - Implementar normalização dinâmica (AGC)

### Referências Técnicas

- **ITU-T G.711**: Recommendation G.711 - Characteristics of wideband digital loudness-limiting hearing aids
- **ANSI S3.4-2005**: Method for measuring and calculating peak-to-peak ratio
- **IEEE 1857.1-2010**: Standard for digital filters - finite impulse response
```

## 📚 Casos de Uso

### Cenário 1: Design de Filtro para Telecomunicação

Especificar filtro lowpass de 5ª ordem com janela Kaiser:

```bash
echo "lowpass; Kaiser; N=5; Passband=60 dB; Ripple=40 dB" | fabric -p make_firac -g=pt-br
```

### Cenário 2: Análise Espectral de Sinal

Projetar filtro para equalização espectral de telefone com resposta específica em dB:

```bash
cat dados_sinal.txt | fabric -p make_firac -g=pt-br
```

### Cenário 3: Filtro para Áudio Profissional

Criar filtro com alta seletividade para áudio profissional:

```bash
echo "highpass; Blackman; N=10; dB=80" | fabric -p make_firac -g=pt-br
```

## 🔗 Referências Externas

### Ferramentas de Design
- **[easy-fir-filter](https://github.com/memovalverd42/easy_fir_filter)**: Python library for FIR filter design
- **[DigitalFilterDesigner2024](https://github.com/fadi-eid/digitalfilterdesigner2024)**: GUI software para filtros digitais
- **[gpuRIR](https://github.com/fairsky0201/gpuRIR)**: GPU-accelerated simulation de filtros FIR

### Documentação Oficial
- **[ITU-T G.711](https://www.itu.int/rec/R-REC-G.711)**: Hearing aids specifications
- **[ITU-R BS.1286](https://www.itu.int/rec/R-REC-BS.1286)**: Testing of hearing aids

## 📝 Notas Técnicas

- **Estrutura de Coeficientes**: Coeficientes armazenados em array [h0, h1, h2, ..., hN-1]
- **Estabilidade**: Filtros com coeficientes muito pequenos ou muito grandes podem ser instáveis
- **Normalização**: Sempre normalizar saída para evitar saturação ou valores muito pequenos
- **Múltiplos Filtros**: É possível projetar filtros com múltiplas bandas de atenuação (ex: 3-band FIR)
- **Implementação em C**: Para aplicações em tempo real, considere usar C otimizado ou assembly

## 🔧 Troubleshooting

- **Especificação Incorreta**: Se o pattern não conseguir gerar coeficientes válidos, revise a entrada
- **Instabilidade do Filtro:** Verifique se a soma dos coeficientes está próxima de 0
- **Resposta Saturada**: Se a resposta estiver constantemente no valor máximo, o filtro pode estar mal configurado
- **Ferramenta Indisponível**: Se `easy-fir-filter` não estiver instalado, sugira instalação

## 📈 Boas Práticas de Design de Filtros FIR

1. **Conformidade com Padrões**: Seguir especificações ITU e ANSI para compatibilidade
2. **Simulação antes de Implementação**: Testar filtros com sinais sintéticos antes de implementar em hardware
3. **Validação Continua**: Verificar resposta em diferentes cenários de teste
4. **Documentação Completa**: Sempre documentar os coeficientes e o uso esperado
5. **Cálculo de Ganho**: Medir e reportar DC gain (ganho de resposta em dB)
6. **Iteração Projetada**: Comece com filtros simples e adicione complexidade gradualmente