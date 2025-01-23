# funcoes auxiliares dplyr

gapminder %>% 
  distinct(continent)

gapminder %>% 
  slice(1:10)

gapminder %>% 
  slice_head(n = 5)

gapminder %>% 
  slice_tail(n = 5)

set.seed(1)
gapminder %>% 
  slice_sample(n = 10)

gapminder %>% 
  filter(year == 2007) %>% 
  slice_max(lifeExp, n = 2)

gapminder %>% 
  filter(year == 2007) %>% 
  slice_min(lifeExp, n = 2)


gapminder %>% 
  filter(year == 2007 | year == 1952) %>% 
  group_by(year) %>% 
  slice_max(lifeExp, n = 2)


gapminder_united <- gapminder %>% 
  unite("country_continent", c(country, continent),
        sep = "_",
        remove = TRUE,
        na.rm = FALSE)

gapminder_united %>%
  separate_wider_delim(country_continent,
                       delim = "_",
                       names = c("country", "continent"))




## ----warning=FALSE, message=FALSE---------------------------------------------
library(tidyverse)
library(gapminder)

gapminder_2007 <- gapminder %>% 
  filter(year == 2007)

ggplot(data = gapminder_2007)


## -----------------------------------------------------------------------------
ggplot(data = gapminder_2007, 
       mapping = aes(x = gdpPercap, y = lifeExp))


## -----------------------------------------------------------------------------
ggplot(data = gapminder_2007, 
       mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point()


## -----------------------------------------------------------------------------
ggplot(data = gapminder_2007, 
       mapping = aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point()


## -----------------------------------------------------------------------------
# Filtrar dados para o Brasil
dados_pais <- gapminder %>%
  filter(country == "Brazil")

# Criar gráfico de linha
ggplot(data = gapminder %>%
         filter(country == "Brazil"), 
       aes(x = year, y = lifeExp)) +
  geom_line()


## -----------------------------------------------------------------------------
# Criar gráfico de barras
ggplot(data = gapminder_2007, aes(x = continent, y = gdpPercap)) +
  geom_bar(stat = "summary", fun = "mean")


## -----------------------------------------------------------------------------
ggplot(data = gapminder_2007, aes(x = continent, y = lifeExp)) +
  geom_boxplot()


## -----------------------------------------------------------------------------
gapminder_2007 %>% 
  group_by(continent) %>% 
  summarise(mean_lifeExp = mean(lifeExp),
            mean_gdpPercap = mean(gdpPercap)) %>% 
  ggplot(aes(x = mean_gdpPercap, y = mean_lifeExp, label = continent)) +
  geom_point() +
  geom_text(vjust = -0.5, hjust = 0.5)


## -----------------------------------------------------------------------------
gapminder_anos <- gapminder %>% 
  filter(year == 1952 | year == 2007)

ggplot(data = gapminder_anos, 
       mapping = aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point() +
  facet_wrap(~year)


## -----------------------------------------------------------------------------
ggplot(data = gapminder_anos, 
       mapping = aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point() +
  facet_wrap(~year) +
  coord_cartesian(ylim = c(40, 83))


## -----------------------------------------------------------------------------
ggplot(data = gapminder_anos, 
       mapping = aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point() +
  facet_wrap(~year) +
  scale_x_log10()


## -----------------------------------------------------------------------------
ggplot(data = gapminder_anos, 
       mapping = aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point() +
  facet_wrap(~year) +
  scale_x_log10() +
  theme_bw()


## -----------------------------------------------------------------------------
ggplot(data = gapminder_anos, 
       mapping = aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point() +
  facet_wrap(~year) +
  scale_x_log10() +
  theme_bw() +
  theme(legend.position = "bottom", 
        text = element_text(size = 12))


## -----------------------------------------------------------------------------
ggplot(data = gapminder_anos, 
       mapping = aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point() +
  facet_wrap(~year) +
  scale_x_log10() +
  labs(x = "PIB per capita (log)", 
       y = "Expectativa de vida", 
       color = "Continente", 
       title = "Relação entre PIB per capita e Expectativa de Vida") +
  theme_bw() +
  theme(legend.position = "bottom")


## -----------------------------------------------------------------------------
ggplot(data = gapminder_anos, 
       mapping = aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point(alpha = 0.5) +
  facet_wrap(~year) +
  scale_x_log10() +
  labs(x = "PIB per capita (log)", 
       y = "Expectativa de vida", 
       color = "Continente", 
       title = "Relação entre PIB per capita e Expectativa de Vida")


## -----------------------------------------------------------------------------
ggplot(data = gapminder_anos, 
       mapping = aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point(alpha = 0.5) +
  facet_wrap(~year) +
  scale_x_log10() +
  scale_color_manual(values = c("blue", "green", "orange", "purple", "red"))+
  labs(x = "PIB per capita (log)", 
       y = "Expectativa de vida", 
       color = "Continente", 
       title = "Relação entre PIB per capita e Expectativa de Vida")


## -----------------------------------------------------------------------------
ggplot(data = gapminder_anos, 
       mapping = aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point(alpha = 0.5) +
  facet_wrap(~year) +
  scale_x_log10() +
  scale_color_brewer(palette = "Set1")+
  labs(x = "PIB per capita (log)", 
       y = "Expectativa de vida", 
       color = "Continente", 
       title = "Relação entre PIB per capita e Expectativa de Vida")


## ----eval=FALSE---------------------------------------------------------------
## # Instalar o pacote patchwork (apenas se ainda não estiver instalado)
## install.packages("patchwork")


## ----message=FALSE------------------------------------------------------------
library(patchwork)

plot1 <- ggplot(data = gapminder_2007, 
       mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5) +
  labs(x = "PIB per capita (log)", 
       y = "Expectativa de vida em 2007", 
       title = "Relação entre PIB per capita e Expectativa de Vida") +
  theme_classic()

plot2 <- ggplot(data = gapminder_2007, 
       mapping = aes(lifeExp)) +
  geom_histogram() +
  labs(title = "Histograma da expectativa de vida",
       x = "Expectativa de Vida em 2007", 
       y = "Frequência") +
  theme_classic()

plot1 + plot2


## ----eval=FALSE---------------------------------------------------------------
## # Instalar o pacote ggthemes (apenas se ainda não estiver instalado)
## install.packages("ggthemes")


## -----------------------------------------------------------------------------
# Carregar o pacote ggthemes
library(ggthemes)

plot0 <- ggplot(data = gapminder_2007, 
       mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5) +
  labs(x = "PIB per capita (log)", 
       y = "Expectativa de vida em 2007")

plot1 <- plot0 + theme_economist()
plot2 <- plot0 + theme_excel()
plot3 <- plot0 + theme_stata()

plot1 +  (plot2 / plot3)


## ----message=FALSE------------------------------------------------------------
library(plotly)

grafico <- ggplot(data = gapminder_anos, 
                  mapping = aes(x = gdpPercap, y = lifeExp, 
                                color = continent, text = country)) +
  geom_point(alpha = 0.5) +
  facet_wrap(~year) +
  scale_x_log10() +
  labs(x = "PIB per capita (log)", 
       y = "Expectativa de vida", 
       color = "Continente", 
       title = "Relação entre PIB per capita e Expectativa de Vida")

ggplotly(grafico)


## ----echo=FALSE---------------------------------------------------------------
billboard_longer <- billboard %>% 
  pivot_longer(
    cols = starts_with("wk"), 
    names_to = "week", 
    values_to = "rank",
    values_drop_na = TRUE
  ) %>% 
  mutate(
    week = parse_number(week)
  )

billboard_longer %>% 
  ggplot(aes(x = week, y = rank, group = track)) + 
  geom_line(alpha = 0.25) + 
  scale_y_reverse() +
  labs(y="Rank", x="Semana", color = "Música") +
  theme_bw() 


## ----echo=FALSE---------------------------------------------------------------
billboard_longer %>% 
  mutate(date = date.entered + lubridate::weeks(week)) %>% 
  ggplot(aes(x = date, y = rank, group = track)) + 
  geom_line(alpha = 0.25) + 
  scale_y_reverse()+
  labs(y="Rank", x="Data", color = "Música") +
  theme_bw() 


## ----echo=FALSE---------------------------------------------------------------
billboard_longer %>% 
  mutate(date = date.entered + lubridate::weeks(week)) %>% 
  filter(track == "Higher" | track == "With Arms Wide Open") %>% 
  ggplot(aes(x = date, y = rank, color = track)) + 
  geom_line(alpha = 1) + 
  scale_y_reverse() +
  labs(y="Rank", x="Data", color = "Música") +
  theme_bw() 


## ----echo=FALSE---------------------------------------------------------------
set.seed(42)
preco_acao <- runif(30, min = 9, max = 15)
media_movel <- numeric(length = 26)  # Vetor para armazenar a média móvel

for (i in 5:30) {
  media_movel[i - 4] <- mean(preco_acao[(i - 4):i])
}

ggplot2::ggplot(tidyr::tibble(t=5:30, mm=media_movel), ggplot2::aes(t, mm)) +
  ggplot2::geom_line(linewidth=2) +
  ggplot2::scale_x_continuous(breaks=seq(5,30,5))+
  ggplot2::labs(x="Dia", y="Média móvel", title="Média Móvel do Preço de Fechamento")+
  ggplot2::ylim(10,15)+
  ggplot2::theme_bw()


## ----echo=FALSE---------------------------------------------------------------
# Função para realizar regressão linear simples
regressao_linear <- function(x, y) {
  modelo <- lm(y ~ x)  # Criando o modelo de regressão linear
  return(modelo)  # Retornando o modelo
}

anos_educacao <- c(10, 12, 14, 16, 18)
salario <- c(2500, 3300, 3550, 3700, 4500)
modelo_regressao <- regressao_linear(anos_educacao, salario)

coefs = data.frame(intercept=coef(modelo_regressao)[1],
                   slope=coef(modelo_regressao)[2],
                   class = "coef")

ggplot2::ggplot(tidyr::tibble(anos_educacao = anos_educacao,
       salario = salario),
       ggplot2::aes(anos_educacao, salario))+
  ggplot2::geom_point() +
  ggplot2::geom_abline(data=coefs,
              ggplot2::aes(intercept=intercept,slope=slope,color=class),
              show.legend = TRUE)+
  ggplot2::scale_color_manual(breaks=c("coef"), 
                              values="blue", labels=c("Modelo linear"))+
  ggplot2::labs(x="Anos de educação", y="Salário", title="Relação entre escolaridade e salário",color="")+
  ggplot2::theme_bw()+
  ggplot2::theme(legend.position = "bottom")

