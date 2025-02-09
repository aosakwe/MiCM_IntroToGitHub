xx
 plot(cars)

# colnames(breast_cancer)
# str(breast_cancer)
# table(breast_cancer$class)


library(ggplot2)
library(ggsignif)
ggplot(data = breast_cancer, aes(x = class, y = clump_thickness, fill = class)) +
  stat_boxplot(geom ='errorbar', width = 0.15) +
  geom_boxplot(width = 0.35) +
  # geom_point(size = 1.5, shape = 21, position = position_jitterdodge()) + 
  geom_signif(comparisons = list(c("benign", "malignant")), 
              test = "wilcox.test",
              test.args=list(alternative = c("two.sided"),
                             paired = FALSE,
                             correct = TRUE,
                             conf.level = 0.95),
              map_signif_level=TRUE,
              size = 0.8, textsize = 4) + 
  scale_x_discrete(labels = c("Benign (N=458)", "Malignant (N=241)")) +
  scale_fill_manual(values = c("#E64B35FF","#4DBBD5FF"),
                    guide = "none") +
  # scale_y_continuous(expand = c(0, 0)) +
  labs(y = "Clump Thickness")+
  theme_prism() + 
  theme(axis.text = element_text(size = 15),
        axis.title.y = element_text(size = 15),
        axis.title.x = element_blank(),
        axis.line = element_line(linewidth = 1),
        axis.ticks.length = unit(0.15, "cm"),
        axis.ticks = element_line(linewidth = 1),
        plot.title = element_text(hjust = 0.5, face = "bold", size = 17))
