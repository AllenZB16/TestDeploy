package main

import (
	"cid-monitor/cid"
	"github.com/go-co-op/gocron"
	"time"
)

var (
	runEveryHours = 24
)

func main() {
	s := gocron.NewScheduler(time.UTC)
	job, err := s.Every(runEveryHours).Hour().Do(cid.DoCidScan)
	if err != nil {
		return
	}
	job.Name("CidScan")
	job.SingletonMode()
	s.StartBlocking()
}
