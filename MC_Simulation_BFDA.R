library(BFDA)

#Simulate population with estimated effect size
sim.H1 <- BFDA.sim(expected.ES=rnorm(10000, 0.7301, 0.36185), type="t.paired",
                   prior=list("Cauchy",list(prior.location=0, prior.scale=sqrt(2)/2)),
                   n.min=20, n.max=80, design = c("sequential"), boundary=10, alternative=c("greater"), B=10000,
                   verbose=TRUE, cores=4, stepsize = 10)

#Simulate null hypothesis
sim.H0 <- BFDA.sim(expected.ES=0, type="t.paired",
                   prior=list("Cauchy", list(prior.location=0, prior.scale=sqrt(2)/2)),
                   n.min=20, n.max=80, design = c("sequential"), boundary=10, alternative=c("greater"), B=10000,
                   verbose=TRUE, cores=4, stepsize = 10)

BFDA.analyze(sim.H1, design="sequential", n.min=20, n.max=80, boundary=10)
BFDA.analyze(sim.H0, design="sequential", n.min=20, n.max=80, boundary=10)

plot(sim.H1, n.min=20, boundary=c(1/10, 10), n.trajectories = 150)
plot(sim.H0, n.min=20, boundary=c(1/10, 10), n.trajectories = 150)