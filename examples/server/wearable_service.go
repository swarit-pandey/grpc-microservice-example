package main

import (
	"fmt"
	"io"
	"math/rand"
	"time"

	wearablepb "github.com/MarioCarrion/grpc-microservice-example/gen/go/wearable/v1"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

type wearableService struct {
	wearablepb.UnimplementedWearableServiceServer
}

func (w *wearableService) BeatsPerMinute(
	req *wearablepb.BeatsPerMinuteRequest,
	stream wearablepb.WearableService_BeatsPerMinuteServer) error {
	for {
		select {
		case <-stream.Context().Done():
			return status.Error(codes.Canceled, "Stream has ended")
		default:
			time.Sleep(1 * time.Second)
			value := 30 + rand.Int31n(80)

			if err := stream.SendMsg(&wearablepb.BeatsPerMinuteResponse{
				Value:  uint32(value),
				Minute: uint32(time.Now().Second()),
			}); err != nil {
				return status.Error(codes.Canceled, "Stream has ended")
			}
		}
	}
}

func (w *wearableService) ConsumeBeatsPerMinute(stream wearablepb.WearableService_ConsumeBeatsPerMinuteServer) error {
	var total uint32

	for {
		value, err := stream.Recv()
		if err == io.EOF {
			return stream.SendAndClose(&wearablepb.ConsumeBeatsPerMinuteResponse{
				Total: total,
			})
		}

		if err != nil {
			return err
		}

		fmt.Println(value.GetUuid(), value.GetMinute(), value.GetValue())
		total++
	}
}
