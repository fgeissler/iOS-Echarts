//
//  FunnelDemoController.m
//  iOS-Echarts
//
//  Created by Pluto Y on 8/22/16.
//  Copyright © 2016 pluto-y. All rights reserved.
//

#import "FunnelDemoController.h"

typedef NS_ENUM(NSInteger, FunnelDemoTypeTag) {
    FunnelDemoTypeTagBasicFunnel1       = 20001,
    FunnelDemoTypeTagMultipleFunnel1    = 20002,
    FunnelDemoTypeTagMultipleFunnel2    = 20003,
    FunnelDemoTypeTagMultipleFunnel3    = 20004,
    FunnelDemoTypeTagBasicFunnel2       = 20005
};

@interface FunnelDemoController ()

@property (weak, nonatomic) IBOutlet PYEchartsView *echartsView;

@end

@implementation FunnelDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initAll];
}

- (void)initAll {
    self.title = @"漏斗图";
    [_echartsView setOption:[PYFunnelDemoOptions basicFunnel1Option]];
    [_echartsView loadEcharts];
}

- (IBAction)demoBtnClick:(id)sender {
    UIButton *btn = (UIButton *)sender;
    PYOption *option;
    switch (btn.tag) {
        case FunnelDemoTypeTagBasicFunnel1:
            option = [PYFunnelDemoOptions basicFunnel1Option];
            break;
        case FunnelDemoTypeTagMultipleFunnel1:
            option = [PYFunnelDemoOptions multipleFunnel1Option];
            break;
        case FunnelDemoTypeTagMultipleFunnel2:
            option = [PYFunnelDemoOptions multipleFunnel2Option];
            break;
        case FunnelDemoTypeTagMultipleFunnel3:
            [self showMultipleFunnelDemo3];
            break;
        case FunnelDemoTypeTagBasicFunnel2:
            [self showBasicFunnelDemo2];
            break;
    }
    if (option != nil) {
        [_echartsView setOption:option];
    }
    [_echartsView loadEcharts];
}

- (void)showMultipleFunnelDemo3 {
    PYOption *option = [[PYOption alloc] init];
    option.title = [[PYTitle alloc] init];
    option.title.text = @"漏斗图(对比)";
    option.title.subtext = @"纯属虚构";
    option.title.x = @"left";
    option.title.y = @"bottom";
    option.tooltip = [[PYTooltip alloc] init];
    option.tooltip.trigger = PYTooltipTriggerItem;
    option.tooltip.formatter = @"{a} <br/>{b} : {c}%";
    option.toolbox = [[PYToolbox alloc] init];
    option.toolbox.show = YES;
    option.toolbox.orient = @"vertical";
    option.toolbox.y = @"center";
    option.toolbox.feature = [[PYToolboxFeature alloc] init];
    option.toolbox.feature.mark = [[PYToolboxFeatureMark alloc] init];
    option.toolbox.feature.mark.show = YES;
    option.toolbox.feature.dataView = [[PYToolboxFeatureDataView alloc] init];
    option.toolbox.feature.dataView.show = YES;
    option.toolbox.feature.dataView.readOnly = NO;
//    option.toolbox.feature.magicType = [[PYToolboxFeatureMagicType alloc] init];
//    option.toolbox.feature.magicType.show = YES;
//    option.toolbox.feature.magicType.type = @[PYSeriesTypePie, PYSeriesTypeFunnel];
//    option.toolbox.feature.magicType.option = @{PYSeriesTypePie:@{@"radius":@[@0, @50]}};
    option.toolbox.feature.restore = [[PYToolboxFeatureRestore alloc] init];
    option.toolbox.feature.restore.show = YES;
    option.legend = [[PYLegend alloc] init];
    option.legend.data = @[@"产品A", @"产品B", @"产品C", @"产品D", @"产品E"];
    option.legend.x = @"left";
    option.legend.orient = @"vertical";
    
    PYFunnelSeries *series1 = [[PYFunnelSeries alloc] init];
    series1.name = @"漏斗图";
    series1.type = PYSeriesTypeFunnel;
    series1.width = @"30%";
    series1.height = @"45%";
    series1.x = @"5%";
    series1.y = @"50%";
    series1.funnelAlign = @"right";
    series1.data = @[@{@"value":@60, @"name":@"产品C"}, @{@"value":@30, @"name":@"产品D"}, @{@"value":@10, @"name":@"产品E"}, @{@"value":@80, @"name":@"产品B"}, @{@"value":@100, @"name":@"产品A"}];
    
    PYFunnelSeries *series2 = [[PYFunnelSeries alloc] init];
    series2.name = @"金字塔";
    series2.type = PYSeriesTypeFunnel;
    series2.width = @"30%";
    series2.height = @"45%";
    series2.x = @"5%";
    series2.y = @"5%";
    series2.funnelAlign = @"right";
    series2.sort = PYSortAscending;
    series2.data = @[@{@"value":@60, @"name":@"产品C"}, @{@"value":@30, @"name":@"产品D"}, @{@"value":@10, @"name":@"产品E"}, @{@"value":@80, @"name":@"产品B"}, @{@"value":@100, @"name":@"产品A"}];
    
    PYFunnelSeries *series3 = [[PYFunnelSeries alloc] init];
    series3.name = @"漏斗图";
    series3.type = PYSeriesTypeFunnel;
    series3.width = @"30%";
    series3.height = @"45%";
    series3.x = @"65%";
    series3.y = @"5%";
    series3.funnelAlign = @"left";
    series3.itemStyle = [[PYItemStyle alloc] init];
    series3.itemStyle.normal = [[PYItemStyleProp alloc] init];
    series3.itemStyle.normal.label = [[PYLabel alloc] init];
    series3.itemStyle.normal.label.position = @"left";
    series3.data = @[@{@"value":@60, @"name":@"产品C"}, @{@"value":@30, @"name":@"产品D"}, @{@"value":@10, @"name":@"产品E"}, @{@"value":@80, @"name":@"产品B"}, @{@"value":@100, @"name":@"产品A"}];
    
    PYFunnelSeries *series4 = [[PYFunnelSeries alloc] init];
    series4.name = @"金字塔";
    series4.type = PYSeriesTypeFunnel;
    series4.width = @"30%";
    series4.height = @"45%";
    series4.x = @"65%";
    series4.y = @"50%";
    series4.funnelAlign = @"left";
    series4.sort = PYSortAscending;
    series4.itemStyle = [[PYItemStyle alloc] init];
    series4.itemStyle.normal = [[PYItemStyleProp alloc] init];
    series4.itemStyle.normal.label = [[PYLabel alloc] init];
    series4.itemStyle.normal.label.position = @"left";
    series4.data = @[@{@"value":@60, @"name":@"产品C"}, @{@"value":@30, @"name":@"产品D"}, @{@"value":@10, @"name":@"产品E"}, @{@"value":@80, @"name":@"产品B"}, @{@"value":@100, @"name":@"产品A"}];
    
    option.series = [[NSMutableArray alloc] initWithArray:@[series1, series2, series3, series4]];
    
    [_echartsView setOption:option];
}

- (void)showBasicFunnelDemo2 {
    PYOption *option = [[PYOption alloc] init];
    option.title = [[PYTitle alloc] init];
    option.title.text = @"漏斗图";
    option.title.subtext = @"纯属虚构";
    option.tooltip = [[PYTooltip alloc] init];
    option.tooltip.trigger = PYTooltipTriggerItem;
    option.tooltip.formatter = @"{a} <br/>{b} : {c}%";
    option.toolbox = [[PYToolbox alloc] init];
    option.toolbox.show = YES;
    option.toolbox = [[PYToolbox alloc] init];
    option.toolbox.show = YES;
    option.toolbox.feature = [[PYToolboxFeature alloc] init];
    option.toolbox.feature.mark = [[PYToolboxFeatureMark alloc] init];
    option.toolbox.feature.mark.show = YES;
    option.toolbox.feature.dataView = [[PYToolboxFeatureDataView alloc] init];
    option.toolbox.feature.dataView.show = YES;
    option.toolbox.feature.dataView.readOnly = NO;
    option.toolbox.feature.restore = [[PYToolboxFeatureRestore alloc] init];
    option.toolbox.feature.restore.show = YES;
    
    option.legend = [[PYLegend alloc] init];
    option.legend.data = @[@"展现", @"点击", @"访问", @"咨询", @"订单"];
    option.calculable = YES;
    
    PYFunnelSeries *series = [[PYFunnelSeries alloc] init];
    series.name = @"漏斗图";
    series.type = PYSeriesTypeFunnel;
    series.x = @"10%";
    series.y = @60;
    series.width = @"80%";
    series.min = @0;
    series.max = @100;
    series.minSize = @"0%";
    series.maxSize = @"100%";
    series.sort = PYSortDescending;
    series.gap = @10;
    series.itemStyle = [[PYItemStyle alloc] init];
    
    PYItemStyleProp *normal = [[PYItemStyleProp alloc] init];
    normal.borderColor = [PYColor colorWithHexString:@"#fff"];
    normal.borderWidth = @1;
    normal.label = [[PYLabel alloc] init];
    normal.label.show = YES;
    normal.label.position = @"inside";
    normal.labelLine = [[PYLabelLine alloc] init];
    normal.labelLine.show = NO;
    normal.labelLine.length = @10;
    normal.labelLine.lineStyle = [[PYLineStyle alloc] init];
    normal.labelLine.lineStyle.width = @1;
    normal.labelLine.lineStyle.type = PYLineStyleTypeSolid;
    series.itemStyle.normal = normal;
    
    PYItemStyleProp *emphasis = [[PYItemStyleProp alloc] init];
    emphasis.borderColor = @"red";
    emphasis.borderWidth = @5;
    emphasis.label = [[PYLabel alloc] init];
    emphasis.label.show = YES;
    emphasis.label.formatter = @"{b}:{c}%";
    emphasis.label.textStyle = [[PYTextStyle alloc] init];
    emphasis.label.textStyle.fontSize = @20;
    emphasis.labelLine = [[PYLabelLine alloc] init];
    emphasis.labelLine.show = YES;
    series.itemStyle.emphasis = emphasis;
    
    series.data = @[@{@"value":@60, @"name":@"访问"}, @{@"value":@40, @"name":@"咨询"}, @{@"value":@20, @"name":@"订单"}, @{@"value":@80, @"name":@"点击"}, @{@"value":@100, @"name":@"展现"}];
    
    option.series = [[NSMutableArray alloc] initWithArray:@[series]];
    
    [_echartsView setOption:option];
}

@end
